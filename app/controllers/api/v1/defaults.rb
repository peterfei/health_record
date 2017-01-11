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
            if params[:wx_id].present?
              if params[:token].present?
                token = ApiUserKey.where(access_token: params[:token]).first
                if token && !token.expired?
                  @current_user = User.find(token.user_id)
                else
                  error!('错误的token', 401)
                end
              else
                @current_user = User.find_by(wx_id: params[:wx_id])
                if @current_user.present?
                  @current_user
                else
                  error!('用户不存在')
                end
              end
            else
              error!('未传wx_id')
            end
          end

          #生成会员卡号
          def create_card_number
            sn = Time.now.strftime('%Y%m%d') << '000001'
            begin
              card_number =  UserVip.last.card_number
              if card_number.present?
                if card_number[0,8].eql? (Time.now.strftime('%Y%m%d'))
                  card_number.succ rescue sn
                else
                  sn
                end
              else
                sn
              end
            rescue Exception => e
              sn
            end
          end

          #生成会员条形码
          def create_barcode
            '123.jpg'
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
