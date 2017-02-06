module API
  module V1
    class MedicalRecordManagements< Grape::API
      include API::V1::Defaults
      include Grape::Kaminari

      resource :medical_record_managements do

          desc "查询用户所有病历记录"
          # params do
          #   requires :user_id, type: Integer, message: "未传user_id"
          # end
          get :all_medical_records do
            authenticate!
            @all_dates = MedicalRecordManagement.select(:created_at).
              where("user_id = ?", @current_user.id).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')").order("created_at DESC")
            @dates = paginate(@all_dates)
            @results = []
            if @dates.present?
              @dates.each do |d|
                @record = {}
                @date = d.created_at.strftime("%Y-%m-%d")
                @record[:record_date] = @date
                @record[:record_content] = MedicalRecordManagement.where("user_id = ? AND created_at LIKE ?", @current_user.id, "%#{@date}%")
                @results.push(@record)
              end
            end
            @results
          end

          desc "添加病历记录"
          params do
            requires :name, type: String, message: "未传病历名称"
            requires :category, type: String, message: "未传病历分类名称"
            requires :image_path, type: String, message: "未传病历图片路径"
            # requires :user_id, type: Integer, message: "未传user_id"
          end
          post :add_medical_record_management do
            # binding.pry
            authenticate!
            # serverID: 4Oyf-SFXnaySR8ncSm86OiuiAAlZqQo-i7UH81EUZLq-UC5PXBeH8FE_lLzCOWdk
            # 下载微信服务器上的图片
            tmp_file = Wechat.api.media params[:image_path]
            # binding.pry
            # img_uuid = SecureRandom.uuid
            uploader = AvatarUploader.new
            uploader.store!(tmp_file)
            # begin
            #   img_path = FileUtils.mv(tmp_file.path, "#{Rails.public_path}/wechat/#{img_uuid}.jpg")
            # rescue Exception=>e
            #   # binding.pry
            #   L.debug("目录不存在,创建目录#{Rails.public_path}/wechat")
            #   FileUtils.mkdir_p("#{Rails.public_path}/wechat")
            #
            #   FileUtils.mv(tmp_file.path, "#{Rails.public_path}/wechat/#{img_uuid}.jpg")
            # end

            begin
              L.info "添加病历记录提交数据为**#{params.to_json}**"
              @record = MedicalRecordManagement.find_by("user_id = ? AND name = ?", @current_user.id, params[:name])
              if @record.present? && @record.category_list.join(",") == params[:category]
                error!('病历记录已存在')
              else
                @medical_record_management = MedicalRecordManagement.new  name: params[:name],
                image_path: uploader.url,
                user_id: @current_user.id,
                thumb_image_path:uploader.thumb.url
                @medical_record_management.category_list.add(params[:category], parse: true)
                if @medical_record_management.save
                  { status: :ok }
                else
                  error!('保存失败')
                end
              end
            rescue Exception => e
              L.debug "添加病历记录数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          desc "删除病历记录"
          params do
            requires :medical_record_management_id, type: Integer, message: "未传medical_record_management_id"
          end
          get :delete_medical_record_management do
            # authenticate!
            begin
              L.info "删除病历记录提交数据为**#{params.to_json}**"
              if MedicalRecordManagement.find(params[:medical_record_management_id]).destroy
                { status: :ok }
              else
                error!('删除失败')
              end
            rescue Exception => e
              L.debug "删除病历记录数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          # encoding: utf-8
          # ########################################################
          # | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
          # | 开发时间: 2017-01-16 15:01:35
          # | 功能说明:病例搜索接口
          # | 备注:默认按name,category,created_at
          # | 标签:get
          # ########################################################
          desc "病例搜索接口"
          params do
            requires :name, type: String, message: "未传name"
          end
          get :search do
            authenticate!
            #find_by_sql
            @name=params[:name]
            if @name.present?
              @ex_where = "medical_record_managements.name LIKE '%#{@name}%' or date_format(medical_record_managements.created_at,'%Y-%m-%d') like '%#{@name}%' or tags.name like '%#{@name}%'"
            end
            #分组排序拿日期
            @all_dates=MedicalRecordManagement.select(:created_at).joins('JOIN taggings on taggings.taggable_id=medical_record_managements.id ').
            joins('JOIN tags on tags.id=taggings.tag_id').where("taggings.taggable_type='MedicalRecordManagement' and medical_record_managements.user_id=#{@current_user.id}").
            where(@ex_where).group("DATE_FORMAT(medical_record_managements.created_at,'%Y-%m-%d')").
            order("medical_record_managements.created_at DESC")
            @dates = paginate(@all_dates)
            #排序拿搜索数据
            @all_data=MedicalRecordManagement.joins('JOIN taggings on taggings.taggable_id=medical_record_managements.id ').
            joins('JOIN tags on tags.id=taggings.tag_id').where("taggings.taggable_type='MedicalRecordManagement' and medical_record_managements.user_id=#{@current_user.id}").
            where(@ex_where).order("medical_record_managements.created_at DESC")
            @data = paginate(@all_data)
            @results = []
            if @dates.present?
              @dates.each do |d|
                @record ={}
                @record[:record_date]=(d.created_at.strftime("%Y-%m-%d"))
                @record[:record_content]=[]
                @data.each do |t|
                  if d.created_at.strftime("%Y-%m-%d")==t.created_at.strftime("%Y-%m-%d")
                    @record[:record_content].push(t)
                    end
                end
                @results.push(@record)
              end
              @results
            else
              error!('暂无数据')
            end

          end

          # encoding: utf-8
          # ########################################################
          # | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
          # | 开发时间: 2017-01-16 17:10:27
          # | 功能说明: 病例搜索接口
          # | 备注: category
          # | 标签: 搜索TWO
          # ########################################################
          desc "病例搜索接口2"
          params do
            requires :name, type: String, message: "未传name"
          end
          get :search_two do
            authenticate!
            @category_all=MedicalRecordManagement.tagged_with(["#{params[:name]}"],:any => true,:wild => true).where("user_id = #{@current_user.id}").
              group("DATE_FORMAT(medical_record_managements.created_at,'%Y-%m-%d')").order("created_at DESC")
            @category = paginate(@category_all)
            @results = []
            if @category.present?
              @category.each do |d|
                @record = {}
                @date = d.created_at.strftime("%Y-%m-%d")
                @record[:record_date] = @date
                @record[:record_content] = MedicalRecordManagement.tagged_with(["#{params[:name]}"],:any => true,:wild => true).where("created_at like '%#{@date}%' and user_id = #{@current_user.id}").order("created_at DESC")
                @results.push(@record)
              end
              @results
            else
              error!("暂无数据")
            end
          end

        end

      end
    end
  end
