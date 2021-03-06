module API
	module V1
		class HealthItems< Grape::API
			include API::V1::Defaults
			include Grape::Kaminari

			resource :health_items do

				desc "查询用户健康项目"
				params do
						# requires :user_id, type: Integer, message: "未传user_id"
						requires :status, type: Integer, message: "未传status"
					end
					get :all_health_items do
						authenticate!
						if params[:status]==1
							@result = HealthItem.where("user_id = ? AND is_check=1", @current_user.id).order("is_admin DESC")
						else
							@result = HealthItem.where("user_id = ?", @current_user.id).order("is_admin DESC, is_check DESC")
						end
						paginate(@result)
					end

					desc "查询用户健康项目"
					params do
						requires :health_item_id, type: Integer, message: "未传health_item_id"
					end
					get :health_item do
						HealthItem.find(params[:health_item_id])
					end

					desc "查询家人健康项目"
					params do
						# requires :user_id, type: Integer, message: "未传user_id"
						requires :family_user_id, type: Integer, message: "未传family_user_id"
					end
					get :family_health_items do
						authenticate!
						@user_focus = UserFocu.find_by("(user_id = ? AND follow_id = ?) OR (user_id = ? AND follow_id = ?) AND whether=1", @current_user.id, params[:family_user_id], params[:family_user_id], @current_user.id)
						if @user_focus.present?
							@family_user_info = User.find(params[:family_user_id])
							@family_health_items = HealthItem.where("user_id = ? AND is_check=1", params[:family_user_id])
							{ family_user_info: @family_user_info, family_health_items: @family_health_items }
						else
							error!("此用户未被关注")
						end
					end

					desc "保存健康项目记录"
					params do
						requires :health_item_id, type: Integer, message: "未传health_item_id"
						requires :content, type: String, message: "未传健康项目内容"
					end
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

					desc "选择或取消健康项目"
					params do
						requires :health_item_id, type: Integer, message: "未传health_item_id"
						requires :is_check, type: Boolean, message: "未传是否开启状态"
					end
					post :check_item do
						# authenticate!
						if params[:is_check].present?
							@is_check = 1
						else
							@is_check = 0
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

					# encoding: utf-8
					# ########################################################
					# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
					# | 开发时间: 2017-02-21 09:46:06
					# | 功能说明:查询用户可自定义的项目
					# | 备注:get_custom_item
					# | 标签:get
					# ########################################################
					desc "查询用户可自定义的项目"
					get :get_custom_item do
						authenticate!
						HealthItem.where("is_admin=? and user_id is NULL",0)
					end


					desc "添加健康项目"
					params do
						requires :name, type: String, message: "未传项目名称"
						optional :unit, type: String
						# requires :user_id, type: String, message: "未传user_id"
						requires :normal_min, type: Integer, message: "未传最小正常值"
						requires :normal_max, type: Integer, message: "未传最大正常值"
					end
					post :add_health_item do
						authenticate!
						begin
							L.info "添加健康项目提交数据为**#{params.to_json}**"
							if HealthItem.find_by("user_id = ? AND name = ?", @current_user.id, params[:name]).present?
								error!('项目已存在')
							else
								@health_item = HealthItem.new name: params[:name],
									unit: params[:unit],
									is_check: 1,
									user_id: @current_user.id,
									is_admin:0,
									normal_min: params[:normal_min],
									normal_max: params[:normal_max]
								if @health_item.save
									{ status: :ok, health_item: @health_item }
								else
									error!('保存失败')
								end
							end
						rescue Exception => e
							L.debug "添加健康项目数据提交错误**#{e.to_json}**"
							error!('提交失败')
						end
					end

					# encoding: utf-8
					# ########################################################
					# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
					# | 开发时间: 2017-01-18 09:27:55
					# | 功能说明:编辑健康项目
					# | 备注:edit_health_item
					# | 标签:post
					# ########################################################
					params do
						requires :id, type: Integer, message: "未传项目id"
						requires :name, type: String, message: "未传项目名称"
						optional :unit, type: String
						requires :normal_min, type: Integer, message: "未传最小正常值"
						requires :normal_max, type: Integer, message: "未传最大正常值"
					end
					desc "编辑健康项目"
					post :edit_health_item do
						authenticate!
						begin
							L.info "编辑健康项目提交数据为**#{params.to_json}**"
							@health_item = HealthItem.find_by("user_id = ? AND id = ?", @current_user.id, params[:id])
							if @health_item.present?
								if @health_item.update(name:params[:name], unit:params[:unit], normal_min:params[:normal_min], normal_max:params[:normal_max])
									{ status: :ok }
								else
									error!('编辑失败')
								end
							end
						rescue Exception => e
							L.debug "编辑健康项目数据提交错误**#{e.to_json}**"
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
