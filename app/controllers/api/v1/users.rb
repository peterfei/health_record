module API
	module V1
		class Users< Grape::API
			include API::V1::Defaults

			resource :users do

				desc "会员注册"
				params do
					requires :wx_id, type: String, message: "未传wx_id"
					requires :username, type: String, message: "未传账号"
					requires :password, type: String, message: "未传密码"
					requires :truename, type: String, message: "未传姓名"
					requires :sex, type: Integer, message: "未传性别"
					requires :age, type: Integer, message: "未传年龄"
					requires :nation, type: String, message: "未传民族"
					requires :id_type, type: Integer, message: "未传证件类型"
					requires :id_code, type: String, message: "未传证件号码"
					requires :blood_type, type: Integer, message: "未传血型"
					requires :children, type: Integer, message: "未传子女数"
					requires :education, type: Integer, message: "未传学历"
					requires :duty, type: String, message: "未传职务"
					requires :hobby_list, type: String, message: "未传兴趣爱好"
					requires :speciality_list, type: String, message: "未传特长"
					requires :job_list, type: String, message: "未传职业"
					requires :skill_level_list, type: String, message: "未传职称"
				end
				post :user_vip do
					begin
						L.info "会员注册提交数据为**#{params.to_json}**"
						@user = User.find_by("wx_id = ?", params[:wx_id])
						if User.find_by("username = ?", params[:username]).present?
							error!("此手机号已注册")
						else
							if @user.present?
								@user.hobby_list.add(params[:hobby_list], parse: true)
								@user.speciality_list.add(params[:speciality_list], parse: true)
								@user.job_list.add(params[:job_list], parse: true)
								@user.skill_level_list.add(params[:skill_level_list], parse: true)
								User.transaction do
									if @user.update(username: params[:username],
										password: params[:password],
										truename: params[:truename],
										sex: params[:sex],
										age: params[:age],
										nation: params[:nation],
										id_type:params[:id_type],
										id_code:params[:id_code],
										blood_type: params[:blood_type],
										children: params[:children],
										education: params[:education],
										duty: params[:duty],
										vip_mark:1)
									UserVip.transaction do
										if UserVip.create! card_number: create_card_number, user_id: @user.id
											{ status: :ok }
										else
											error!('保存失败')
										end
									end
								else
									error!('保存失败')
								end
							end
						else
							User.transaction do
								@new_user = User.new :wx_id=> params[:wx_id],
								wx_name: params[:wx_name],
								wx_avatar: params[:wx_avatar],
								username: params[:username],
								password: params[:password],
								truename: params[:truename],
								sex: params[:sex],
								age: params[:age],
								nation: params[:nation],
								id_type:params[:id_type],
								id_code:params[:id_code],
								blood_type: params[:blood_type],
								children: params[:children],
								education: params[:education],
								duty: params[:duty],
								vip_mark:1
								@new_user.hobby_list.add(params[:hobby_list], parse: true)
								@new_user.speciality_list.add(params[:speciality_list], parse: true)
								@new_user.job_list.add(params[:job_list], parse: true)
								@new_user.skill_level_list.add(params[:skill_level_list], parse: true)
								if @new_user.save
									UserVip.transaction do
										if UserVip.create! card_number: create_card_number, user_id: @new_user.id
											{ status: :ok }
										else
											error!('保存失败')
										end
									end
								else
									error!('保存失败')
								end
							end
						end
					end
				rescue Exception => e
					L.debug "用户注册数据提交错误**#{e.to_json}**"
					error!('提交失败')
				end
			end

			desc "用户登录"
			params do
				requires :wx_id, type: String, message: "未传wx_id"
				optional :username, type: String
				optional :password, type: String
			end
			post :login do
				if params[:wx_id]
					user = User.find_by("wx_id = ?", params[:wx_id])
					if user.present?
						if user.vip_mark==1
							token = ApiUserKey.where("user_id = ?", user.id).first
							if token && !token.expired?
								{ token: token.access_token, user: user }
							else
								if params[:username] && params[:password]
									if params[:username]
										user = User.find_by username:params[:username].downcase
									end
									if user && user.valid_password?(params[:password])
										key = ApiUserKey.create(user_id: user.id)
										{ token: key.access_token, user: user }
									else
										error!('用户名或密码错误', 401)
									end
								else
									error!('登录时间已过期,请重新登录')
								end
							end
						else
							error!('您还不是会员,请先注册成为会员')
						end
					else
						error!('未知的wx_id,请注册')
					end
				else
					error!('未传wx_id')
				end
			end

			desc "获取用户信息"
			get :get_user_info do
				authenticate!
				User.find(@current_user.id).attributes
			end

				# encoding: utf-8
				# ########################################################
				# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
				# | 开发时间: 2017-01-11 13:38:17
				# | 功能说明:是否是VIP
				# | 备注:vip_mark
				# | 标签:get
				# ########################################################
				desc "是否是VIP"
				params do
					requires :wx_id, type: String, message: "未传wx_id"
				end
				get :vip_mark do
					authenticate!
					@current_user.vip_mark rescue nil
					# binding.pry
					# User.find(@current_user.id).vip_mark
				end

				# ########################################################
				# | Author: wangyang
				# | Time: 2017-02-14 09:31:01
				# | Description: 编辑获取用户信息
				# ########################################################
				desc "编辑获取用户信息"
				get :edit_user_info do
					authenticate!
					User.find(@current_user.id).attributes
				end

				 # ########################################################
				# | Author: guoxiaofeng
				# | Time: 2017-02-14 09:31:01
				# | Description: 获取关注标识
				# ########################################################
				desc "获取关注标识"
				get :get_code do
					authenticate!
					user=@current_user.wx_id
					code=user[user.length-6,6]
				end

				# encoding: utf-8
				# ########################################################
				# | 作者: guoxiaofeng <guoxiaofeng@rongyitech.com>
				# | 开发时间: 2017-01-11 13:43:05
				# | 功能说明:编辑个人信息
				# | 备注:edit_details
				# | 标签:post
				# ########################################################
				desc "编辑个人信息"
				params do
					# requires :user_id, type: Integer, message: "未传user_id"
					requires :truename, type: String, message: "未传姓名"
					requires :sex, type: Integer, message: "未传性别"
					requires :age, type: Integer, message: "未传年龄"
					requires :nation, type: String, message: "未传民族"
					requires :education, type: Integer, message: "未传学历"
					requires :id_code, type: String, message: "未传证件号码"
					requires :id_type, type: Integer, message: "未传证件类型"
					requires :blood_type, type: Integer, message: "未传血型"
					requires :children, type: Integer, message: "未传子女数"
					requires :duty, type: String, message: "未传职务"
					requires :hobby_list, type: String, message: "未传兴趣爱好"
					requires :speciality_list, type: String, message: "未传特长"
					requires :skill_level_list, type: String, message: "未传子职称"
					requires :job_list, type: String, message: "未传职业"
				end
				post :edit_details do
					authenticate!
					begin
						L.info "编辑个人信息提交数据为**#{params.to_json}**"
						@user=User.find(@current_user.id)
						if @user.present?
							@user.hobby_list=params[:hobby_list]
							@user.job_list=params[:job_list]
							@user.speciality_list=params[:speciality_list]
							@user.skill_level_list=params[:skill_level_list]
							@user.save!
							if@user.update(truename:params[:truename],
								sex:params[:sex],
								age:params[:age],
								nation:params[:nation],
								education:params[:education],
								id_code:params[:id_code],
								id_type:params[:id_type],
								duty:params[:duty],
								blood_type:params[:blood_type],
								children:params[:children])
							{ status: :ok }
						else
							error!('编辑失败')
						end
					end
				rescue Exception => e
					L.debug "编辑个人信息数据提交错误**#{e.to_json}**"
					error!('提交失败')
				end
			end

		end

	end
end
end
