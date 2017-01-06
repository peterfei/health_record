class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end

  on :event, with: 'subscribe' do |request|
    # request.reply.text "User #{request[:FromUserName]} subscribe now"
    request.reply.text "<a href='#'>subsribe</a>"
  end

  on :text, with: '张轩' do |request|
    request.reply.text "<a href='http://www.baidu.com'>subsribe</a>" #回复帮助信息
  end


end
