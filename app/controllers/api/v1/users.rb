module API
  module V1
    class Users< Grape::API
        include API::V1::Defaults

        resource :users do
          params do
            requires :username, type: String, message: "未传账号"
            requires :password, type: String, message: "未传密码"
            requires :truename, type: String, message: "未传姓名"
            requires :sex, type: Integer, message: "未传性别"
            requires :age, type: Integer, message: "未传年龄"
            requires :blood_type, type: Integer, message: "未传血型"
            requires :children, type: Integer, message: "未传子女数"
            requires :wx_id, type: String, message: "未传微信ID"
            requires :hobby_list, type: String, message: "未传兴趣爱好"
            requires :job_list, type: String, message: "未传职业"
          end
          desc "用户注册"
          post :register do
            begin
              L.info "用户注册提交数据为**#{params.to_json}**"
              @user = User.new username: params[:username], password: params[:password], truename: params[:truename], sex: params[:sex], age: params[:age], blood_type: params[:blood_type], children: params[:children], wx_id: params[:wx_id]
              @user.hobby_list.add(params[:hobby_list], parse: true)
              @user.job_list.add(params[:job_list], parse: true)
              if @user.save
                { status: :ok }
              else
                error!('保存失败')
              end
            rescue Exception => e
              L.debug "用户注册数据提交错误**#{e.to_json}**"
              error!('提交失败')
            end
          end

          params do
            requires :wx_id, type: String, message: "未传wx_id"
            optional :username, type: String, message: "未传username"
            optional :password, type: String, message: "未传Password"
          end
          desc "用户登录"
          post :login do
            if params[:wx_id]
              user = User.find_by("wx_id = ?", params[:wx_id])
              if user.present?
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
                error!('未知的wx_id,请注册')
              end
            else
              error!('未传wx_id')
            end
          end

        end

    end
  end
end
