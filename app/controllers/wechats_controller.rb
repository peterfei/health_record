class WechatsController < ActionController::Base
	# For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
	wechat_responder
	# wechat.jsapi_ticket.signature "app/"
	on :text do |request, content|
		request.reply.text "echo: #{content}" # Just echo
	end

  on :event, with: 'subscribe' do |request|
		#查询参数设置
		if request[:EventKey].present?
			mark = request[:EventKey][8...-1] rescue ''
		end
		#生成用户数据
    begin
      user = OpenStruct.new(wechat.user request[:FromUserName])
      unless User.where(wx_id:user.openid).exists?
        User.transaction do
          User.create! truename:user.nickname,wx_avatar:user.headimgurl,wx_id:user.openid,wx_name:user.nickname,mark:mark
        end
      end
		rescue Exception => e
			L.debug "微信关注用户获取失败#{e.to_json}"
		end
		#欢迎消息发送
		# request.reply.text "欢迎使用 #{request[:FromUserName]}"
		# news = (1..1).each_with_object([]) { |n, memo| memo << { title: '新闻标题', description: "第#{n}条新闻的内容#{n.hash}" } }
		news = WxMessage.where(:message_type=>'news',:status=>1).order('id asc').each_with_object([]){ |n,memo|
			memo << { title:n.title,description:n.description,pic_url:root_url[0...-1]+n.pic_url.url,url:n.url}
		}
		request.reply.news(news) do |article, n| # 回复"articles"
			article.item title: "#{n[:title]}", description: n[:description], pic_url: n[:pic_url], url: n[:url]
		end
	end

	on :event,with: 'SCAN' do |request|

	end

	on :text, with: '张轩' do |request|
		request.reply.text "欢迎使用,请先<a href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx53eb0519112c5efc&redirect_uri=#{URI::escape(root_url << 'app#/createName')}&response_type=code&scope=snsapi_base&state=123#wechat_redirect'>注册</a>成我们会员，尊享服务." #回复帮助信息
	end


	# 当用户点击菜单时
	on :view, with: 'http://jkgl.ezu365.cn/app' do |request, view|
		request.reply.text "#{request[:FromUserName]} view #{view}"
	end
end
