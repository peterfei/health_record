module API
  module V1
    class UserFocus< Grape::API
      include API::V1::Defaults

			resource :user_focus do
				# encoding: utf-8
				# ########################################################
				# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
				# | 开发时间: 2017-01-09 13:31:26
				# | 功能说明:请求关注别人
				# | 备注:添加关注
				# | 标签:post
				# ########################################################
				params do
					requires :tel, type: String, message: "未传tel"
					# requires :user_id, type: Integer, message: "未传user_id"
					requires :appellation, type: String, message: "未传appellation"
				end
				desc "添加关注"
				post :add_focu do
					authenticate!
					begin
						L.info "添加关注提交数据为**#{params.to_json}**"
						user=User.find_by("username=#{params[:tel]}")
						if user.present?
							if  user.id != @current_user.id
								follow_id=user.id
								focu=UserFocu.where("user_id='#{@current_user.id}' and follow_id='#{follow_id}' and (whether = 1 or whether = 0) ")
								if focu.present?
									error!('请勿重复提交！')
								else
									if UserFocu.create! appellation: params[:appellation], follow_id: follow_id, user_id: @current_user.id, whether: 0
										{ status: :ok }
									else
										error!('保存失败')
									end
								end
							else
								error!('您不能关注您自己')
							end
						else
							error!('该用户不存在')
						end
					rescue Exception => e
						L.debug "添加关注数据提交错误**#{e.to_json}**"
						error!('提交失败')
					end
				end
				# encoding: utf-8
				# ########################################################
				# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
				# | 开发时间: 2017-01-09 13:30:08
				# | 功能说明:是否同意别人的请求关注
				# | 备注:     whether处理结果：0为未处理，1为同意，2为忽略
				# | 标签:处理关注请求
				# ########################################################
				params do
					requires :focu_id, type: Integer, message: "未传focu_id"
					requires :whether, type: Integer, message: "未传whether"
				end
				desc"处理关注请求"
				post :problems_focu do
					# authenticate!
					begin
						L.info "处理关注请求提交数据为**#{params.to_json}**"
						@focu=UserFocu.find(params[:focu_id])
						if UserFocu.find(params[:focu_id]).update(whether: params[:whether])
							if params[:whether]==1
								UserFocu.create! appellation: @focu.user.truename, follow_id: @focu.user_id, user_id: @focu.follow_id, whether: 1
							end
							{ status: :ok }
						else
							error!('保存失败')
						end
					rescue Exception => e
						L.debug "处理关注请求数据提交错误**#{e.to_json}**"
						error!('提交失败')
					end
				end

				# encoding: utf-8
				# ########################################################
				# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
				# | 开发时间: 2017-01-09 14:06:52
				# | 功能说明:被请求关注的列表
				# | 备注:关注列表
				# | 标签:post
				# ########################################################
				# params do
				# 	requires :user_id, type: Integer, message: "未传user_id"
				# end
				desc"关注列表"
				get :list_focu do
					authenticate!
					UserFocu.where("follow_id='#{@current_user.id}' or user_id='#{@current_user.id}'")
				end
				# encoding: utf-8
				# ########################################################
				# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
				# | 开发时间: 2017-01-18 11:04:46
				# | 功能说明:编辑关注
				# | 备注:编辑被关注人称呼
				# | 标签:post
				# ########################################################
				desc"编辑关注"
				params do
					requires :focu_id, type: Integer, message: "未传focu_id"
					requires :appellation, type: String, message: "未传appellation"
				end
				post :edit_focu do
					#authenticate!
					begin
						L.info "编辑关注提交数据为**#{params.to_json}**"
						if UserFocu.find(params[:focu_id]).update(appellation: params[:appellation])
							{ status: :ok }
						else
							error!('保存失败')
						end
					rescue Exception => e
						L.debug "编辑关注数据提交错误**#{e.to_json}**"
						error!('提交失败')
					end
				end
				# encoding: utf-8
				# ########################################################
				# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
				# | 开发时间: 2017-01-18 11:04:46
				# | 功能说明:删除关注
				# | 备注:删除已关注者
				# | 标签:get
				# ########################################################
				desc"删除关注"
				get :remove_focu	 do
					authenticate!
					begin
						L.info "删除关注提交数据为**#{params.to_json}**"
						if UserFocu.where("follow_id='#{@current_user.id}' or user_id='#{@current_user.id}'").destroy
							{ status: :ok }
						else
							error!('删除失败')
						end
					rescue Exception => e
						L.debug "删除关注数据提交错误**#{e.to_json}**"
						error!('提交失败')
					end
				end


			end
		end
	end
end
