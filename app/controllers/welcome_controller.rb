class WelcomeController < ApplicationController
	wechat_api
	def index
		@total_users = User.all.count rescue 0
		@new_users = User.where("create_at > ?", Time.now.at_beginning_of_day).count rescue 0
		@total_health_items = HealthItem.all.count rescue 0
		@new_health_items = HealthItem.where("create_at > ?", Time.now.at_beginning_of_day).count rescue 0
	end
end
