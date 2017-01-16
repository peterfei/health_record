module API
  module V1
    class HealthItems< Grape::API
        include API::V1::Defaults

        resource :health_items do
          params do
            # requires :user_id, type: Integer, message: "未传user_id"
            requires :status, type: Integer, message: "未传status"
          end
          desc "查询用户健康项目"
          get :all_health_items do
            authenticate!
            if params[:status]==1
              HealthItem.where("user_id = ? AND is_check=1", @current_user.id)
            else
              HealthItem.where("user_id = ?", @current_user.id)
            end
          end

          params do
            requires :health_item_id, type: Integer, message: "未传health_item_id"
            requires :content, type: String, message: "未传健康项目内容"
          end
          desc "保存健康项目记录"
          post :add_item_record do
            # authenticate!
            begin
              L.info "健康项目记录提交数据为**#{params.to_json}**"
              if HealthItemRecord.create! content: params[:content],health_item_id: params[:health_item_id]
                { status: :ok }
              else
                error!('保存失败')
              end
            rescue Exception => e
              L.debug "健康项目记录数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          params do
            requires :health_item_id, type: Integer, message: "未传health_item_id"
            requires :is_check, type: Boolean, message: "未传是否开启状态"
          end
          desc "选择或取消健康项目"
          post :check_item do
            # authenticate!
            if params[:is_check]==1
              @is_check = 0
            else
              @is_check = 1
            end
            begin
              L.info "选择或取消健康项目提交数据为**#{params.to_json}**"
              if HealthItem.find(params[:health_item_id]).update(is_check: @is_check)
                { status: :ok }
              else
                error!('保存失败')
              end
            rescue Exception => e
              L.debug "选择或取消健康项目数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          params do
            requires :name, type: String, message: "未传项目名称"
            optional :unit, type: String
            # requires :user_id, type: String, message: "未传user_id"
            requires :normal_min, type: Integer, message: "未传最小正常值"
            requires :normal_max, type: Integer, message: "未传最大正常值"
          end
          desc "添加健康项目"
          post :add_health_item do
            authenticate!
            begin
              L.info "添加健康项目提交数据为**#{params.to_json}**"
              if HealthItem.find_by("user_id = ? AND name = ?", @current_user.id, params[:name]).present?
                error!('项目已存在')
              else
                if HealthItem.create! name: params[:name], unit: params[:unit], is_check: 0, user_id: @current_user.id, is_admin:0, normal_min: params[:normal_min], normal_max: params[:normal_max]
                  { status: :ok }
                else
                  error!('保存失败')
                end
              end
            rescue Exception => e
              L.debug "添加健康项目数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          params do
            requires :health_item_id, type: Integer, message: "未传health_item_id"
          end
          desc "删除健康项目"
          get :delete_health_item do
            # authenticate!
            begin
              L.info "删除健康项目提交数据为**#{params.to_json}**"
              if HealthItem.find(params[:health_item_id]).destroy
                { status: :ok }
              else
                error!('删除失败')
              end
            rescue Exception => e
              L.debug "删除健康项目数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

        end

    end
  end
end
