module API
  module V1
    class Commons< Grape::API
      include API::V1::Defaults
      
      resource :commons do
        desc "用户兴趣爱好"
        get :hobbys do
          Setting.hobby
        end

        desc "用户职业"
        get :jobs do
          Setting.job
        end
      end
      
    end
  end
end
