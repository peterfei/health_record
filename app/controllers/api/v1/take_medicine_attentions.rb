module API
  module V1
    class TakeMedicineAttentions< Grape::API
        include API::V1::Defaults

        resource :take_medicine_attentions do
          params do
            requires :take_medicine_management_id, type: Integer, message: "未传take_medicine_management_id"
          end
          desc "查询某服药记录所有提醒时间"
          get :all_medicine_attentions do
            # authenticate!
            TakeMedicineAttention.where("take_medicine_management_id = ?", params[:take_medicine_management_id])
          end

          params do
            requires :take_medicine_management_id, type: Integer, message: "未传take_medicine_management_id"
            requires :medicine_attention_time, type: String, message: "未传服药记录提醒时间"
          end
          desc "添加服药记录提醒时间"
          post :add_take_medicine_attention do
            # authenticate!
            begin
              L.info "添加服药记录提醒时间提交数据为**#{params.to_json}**"
              if TakeMedicineAttention.create! medicine_attention_time: params[:medicine_attention_time], take_medicine_management_id: params[:take_medicine_management_id]
                { status: :ok }
              else
                error!('保存失败')
              end
            rescue Exception => e
              L.debug "添加服药记录提醒时间数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          params do
            requires :take_medicine_attention_id, type: Integer, message: "未传take_medicine_attention_id"
          end
          desc "删除服药记录提醒时间"
          get :delete_take_medicine_attention do
            authenticate!
            begin
              L.info "删除服药记录提醒时间提交数据为**#{params.to_json}**"
              if TakeMedicineAttention.find(params[:take_medicine_attention_id]).destroy
                { status: :ok }
              else
                error!('删除失败')
              end
            rescue Exception => e
              L.debug "删除服药记录提醒时间数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end


        end

    end
  end
end
