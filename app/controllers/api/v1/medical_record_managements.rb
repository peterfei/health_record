module API
  module V1
    class MedicalRecordManagements< Grape::API
        include API::V1::Defaults

        resource :medical_record_managements do
          params do
            requires :user_id, type: Integer, message: "未传user_id"
          end
          desc "查询用户所有病历记录"
          get :all_medical_records do
            # authenticate!
            @dates = MedicalRecordManagement.select(:created_at).where("user_id = ?", params[:user_id]).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
            @results ||= []
            @dates.each do |d|
              @records = {}
              @date = d.created_at.strftime("%Y-%m-%d")
              @records[:record_date] = @date
              @records[:record_content] = MedicalRecordManagement.where("user_id = ? AND created_at LIKE ?", params[:user_id], "%#{@date}%")
              @results.push(@records)
            end
            @results
          end

          params do
            requires :name, type: String, message: "未传病历名称"
            requires :category, type: Integer, message: "未传病历分类名称"
            requires :image_path, type: String, message: "未传病历图片路径"
            requires :user_id, type: Integer, message: "未传user_id"
          end
          desc "添加病历记录"
          post :add_medical_record_management do
            # authenticate!
            begin
              L.info "添加病历记录提交数据为**#{params.to_json}**"
              if MedicalRecordManagement.create! name: params[:name], category: params[:category], image_path: params[:image_path], user_id: params[:user_id]
                { status: :ok }
              else
                error!('保存失败')
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
