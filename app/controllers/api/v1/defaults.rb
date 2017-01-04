module API
  module V1
    module Defaults
      extend ActiveSupport::Concern
      require 'grape-kaminari' #分页
      
      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        helpers do
          def logger
            Rails.logger
          end

          def authenticate!
            error!('接口非法!', 401) unless current_user
          end

          def current_user
            token = ApiUserKey.where(access_token: params[:token]).first
            if token && !token.expired?
              @current_user = User.find(token.user_id)
            else
              error!('错误的token', 401)
            end
          end

        end



        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error_response(message: e.message, status: 422)
        end

      end

    end
  end
end
