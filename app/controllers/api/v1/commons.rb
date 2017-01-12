module API
  module V1
    class Commons< Grape::API
      include API::V1::Defaults
      # wechat_api
      resource :commons do
        desc "用户兴趣爱好"
        get :hobbys do
          Setting.hobby
        end

        desc "用户特长"
        get :specialitys do
          Setting.speciality
        end

        desc "用户职业"
        get :jobs do
          Setting.job
        end

        desc "用户职称"
        get :skill_levels do
          Setting.skill_level
        end

        desc "病历分类"
        get :categorys do
          Setting.category
        end

        desc '短信验证码接口'
        params do
          requires :phone,type: String, message:'手机号码不能为空'
        end
        post :sms_api do
          if params[:phone].size != 11
            error!('电话号码格式不正确')
          else
            result = SmsApi.new.verify_code(params[:phone])
            {data:result,status: 1}
          end
        end
      end

      resource :wechat do
         desc "获取js api tickets"
         get :get_js_api_tickets do
            binding.pry
         end
      end
      
    end
  end
end
