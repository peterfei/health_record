Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wechat, Figaro.env.wechat_app_id, Figaro.env.wechat_secret
end