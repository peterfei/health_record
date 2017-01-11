class Account < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :authentication_keys => [:username]
	enum role:[:admin, :general]
	validates :username, uniqueness:{message:'不能重复'}, on: :create
	validates :role, presence:{message:'不能为空'}, on: :create
	validates :username, presence: {message:'账号不能为空'}
	validates :password, presence: {message:'不能为空'}, length:{:within => 6..32, message: '长度请设置为6~32位！'}
	validates_confirmation_of :password, message: '两次密码不一致'

	def email_required?
		false
	end
end
