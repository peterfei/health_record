class WechatsController < ActionController::Base
	# For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
	wechat_responder
	# wechat.jsapi_ticket.signature "app/"
	on :text do |request, content|
		request.reply.text "echo: #{content}" # Just echo
	end

  on :event, with: 'subscribe' do |request|


    begin
      user = OpenStruct.new(wechat.user request[:FromUserName])
      unless User.where(wx_id:user.openid).exists?

        User.transaction do
           # if user.sex=='2' ||user.sex.to_i==2
           # 	sex=1
           # else
           #  sex=0
           # end
          User.create! truename:user.nickname,wx_avatar:user.headimgurl,wx_id:user.openid,wx_name:user.nickname

        end
      end
		rescue Exception => e
			L.debug "微信关注用户获取失败#{e.to_json}"
		end
		# request.reply.text "欢迎使用 #{request[:FromUserName]}"
		request.reply.text Setting.template_info #template_img模板图片
	end

	on :text, with: '张轩' do |request|
		request.reply.text "欢迎使用,请先<a href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx53eb0519112c5efc&redirect_uri=#{URI::escape(root_url << 'app#/createName')}&response_type=code&scope=snsapi_base&state=123#wechat_redirect'>注册</a>成我们会员，尊享服务." #回复帮助信息
	end


	# 当用户点击菜单时
	on :view, with: 'http://jkgl.ezu365.cn/app' do |request, view|
		request.reply.text "#{request[:FromUserName]} view #{view}"
	end
end
