module API
  module V1
    class HealthItemAttentions< Grape::API
        include API::V1::Defaults

        resource :health_item_attentions do
          params do
            requires :health_item_id, type: Integer, message: "未传health_item_id"
          end
          desc "查询某健康项目所有提醒时间"
          get :all_item_attentions do
            # authenticate!
            HealthItemAttention.where("health_item_id = ?", params[:health_item_id])
          end

          params do
            requires :health_item_id, type: Integer, message: "未传health_item_id"
            requires :item_attention_time, type: String, message: "未传item_attention_time"
          end
          desc "添加健康项目提醒时间"
          post :add_health_item_attention do
            # authenticate!
            begin
              L.info "添加健康项目提醒时间提交数据为**#{params.to_json}**"
              if HealthItemAttention.create! health_item_id: params[:health_item_id], item_attention_time: params[:item_attention_time]
                { status: :ok }
              else
                error!('保存失败')
              end
            rescue Exception => e
              L.debug "添加健康项目提醒时间数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          params do
            requires :health_item_attention_id, type: Integer, message: "未传health_item_attention_id"
          end
          desc "删除健康项目提醒时间"
          get :delete_health_item_attention do
            # authenticate!
            begin
              L.info "删除健康项目提醒时间提交数据为**#{params.to_json}**"
              if HealthItemAttention.find(params[:health_item_attention_id]).destroy
                { status: :ok }
              else
                error!('删除失败')
              end
            rescue Exception => e
              L.debug "删除健康项目提醒时间数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end


        end

    end
  end
end
