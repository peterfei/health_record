class WechatApiController <  ActionController::Base
	wechat_api


	def text
		template = YAML.load(File.read("#{Rails.public_path}/tem.yml"))
		wechat.template_message_send Wechat::Message.to('oF2Dhjny0UcMln2M6TIEJWH3HuIw').template(template['template'])
	end

	def wx_rist
			# binding.pry
		wechat_oauth2 do |openid|
			redirect_to("#{root_url<<"app?wx_id="<<openid<<"#/createName"}")
		end

	end

	def wx_health_data
		wechat_oauth2 do |openid|
			redirect_to("#{root_url<<"app?wx_id="<<openid<<"#/index"}")
		end
	end


end
