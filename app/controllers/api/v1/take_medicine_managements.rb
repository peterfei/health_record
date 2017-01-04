module API
  module V1
    class TakeMedicineManagements< Grape::API
        include API::V1::Defaults

        resource :take_medicine_managements do
          params do
            requires :user_id, type: Integer, message: "未传user_id"
          end
          desc "查询用户所有服药记录"
          get :all_take_medicines do
            # authenticate!
            TakeMedicineManagement.where("user_id = ?", params[:user_id])
          end

          params do
            requires :name, type: String, message: "未传药品名称"
            requires :usage, type: Integer, message: "未传药品用法"
            requires :dosage, type: String, message: "未传药品用量"
            requires :user_id, type: Integer, message: "未传user_id"
          end
          desc "添加服药记录"
          post :add_take_medicine_management do
            # authenticate!
            begin
              L.info "添加服药记录提交数据为**#{params.to_json}**"
              if TakeMedicineManagement.create! name: params[:name], usage: params[:usage], dosage: params[:dosage], user_id: params[:user_id]
                { status: :ok }
              else
                error!('保存失败')
              end
            rescue Exception => e
              L.debug "添加服药记录数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          params do
            requires :take_medicine_management_id, type: Integer, message: "未传take_medicine_management_id"
          end
          desc "删除服药记录"
          get :delete_take_medicine_management do
            # authenticate!
            begin
              L.info "删除服药记录提交数据为**#{params.to_json}**"
              if TakeMedicineManagement.find(params[:take_medicine_management_id]).destroy
                { status: :ok }
              else
                error!('删除失败')
              end
            rescue Exception => e
              L.debug "删除服药记录数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end


        end

    end
  end
end
