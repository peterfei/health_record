module API
  module V1
    class Commons< Grape::API
      include API::V1::Defaults
      
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
      end
      
    end
  end
end
