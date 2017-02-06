module API
  module V1
    class TakeMedicineManagements< Grape::API
        include API::V1::Defaults
        include Grape::Kaminari

        resource :take_medicine_managements do

          desc "查询用户所有服药记录"
          get :all_take_medicines do
            authenticate!
            @result = TakeMedicineManagement.where("user_id = ?", @current_user.id)
            paginate(@result)
          end

          desc "添加服药记录"
          params do
            requires :name, type: String, message: "未传药品名称"
            requires :usage, type: Integer, message: "未传药品用法"
            requires :dosage, type: String, message: "未传药品用量"
            # requires :user_id, type: Integer, message: "未传user_id"
          end
          post :add_take_medicine_management do
            authenticate!
            begin
              L.info "添加服药记录提交数据为**#{params.to_json}**"
              @record = TakeMedicineManagement.find_by("user_id = ? AND name = ?",@current_user.id,params[:name])
              if @record.present?
                error!('服药记录已存在')
              else
                if TakeMedicineManagement.create! name: params[:name], usage: params[:usage], dosage: params[:dosage], user_id: @current_user.id
                  { status: :ok }
                else
                  error!('保存失败')
                end
              end
            rescue Exception => e
              L.debug "添加服药记录数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          desc "删除服药记录"
          params do
            requires :take_medicine_management_id, type: Integer, message: "未传take_medicine_management_id"
          end
          get :delete_take_medicine_management do
            authenticate!
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
