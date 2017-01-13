module API
  module V1
    class MedicalRecordManagements< Grape::API
        include API::V1::Defaults

        resource :medical_record_managements do
          # params do
          #   requires :user_id, type: Integer, message: "未传user_id"
          # end
          desc "查询用户所有病历记录"
          get :all_medical_records do
            authenticate!
            @dates = MedicalRecordManagement.select(:created_at).
              where("user_id = ?", @current_user.id).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
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

          params do
            requires :name, type: String, message: "未传病历名称"
            requires :category, type: String, message: "未传病历分类名称"
            requires :image_path, type: String, message: "未传病历图片路径"
            # requires :user_id, type: Integer, message: "未传user_id"
          end
          desc "添加病历记录"
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

          params do
            requires :medical_record_management_id, type: Integer, message: "未传medical_record_management_id"
          end
          desc "删除病历记录"
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


        end

    end
  end
end
