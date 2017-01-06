class AccountsController < ApplicationController
	before_action :authenticate_account!
	add_breadcrumb '账号管理', :accounts_path
	def index
		@account=Account.all
	end

	#新增账号
	def new
		add_breadcrumb "新建账号", :new_account_path
		@account = Account.new
	end
	#新增进数据库
	def create_account
		@accounts = Account.new(edit_user_params)
		respond_to do |format|
			if @accounts.save
				format.html { redirect_to accounts_url, notice: '添加成功！' }
			else
				format.html { render :new }
			end
		end
	end
	#删除账号
	def destroy_account
	  @account=Account.find(params[:id])
	  @account.destroy
	  respond_to do |format|
	    format.html { redirect_to accounts_url, notice: '删除成功！' }
	    format.json { head :no_content }
	  end
	end

	#编辑账号
	def update_account
		@account=Account.find(params[:id])
	end
	#更新账号
	def edit_account
		#binding.pry
		@account=Account.find(params[:account][:id])
		respond_to do |format|
			if @account.update(account_params)
				format.html { redirect_to accounts_path, notice: '密码修改成功！' }
				format.json { render accounts_path, status: :ok }
			else
				format.html { render :update_account }
				format.json { render json: @accounts.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit_password
		@account = current_account
	end

	def update_password
		@account = Account.find(current_account.id)
		respond_to do |format|
			if @account.update(account_params)
				bypass_sign_in(@account)
				format.html { redirect_to root_path, notice: '密码修改成功！' }
	        		format.json { render root_path, status: :ok }
			else
				format.html { render :edit_password }
	        		format.json { render json: @account.errors, status: :unprocessable_entity }
			end
		end
	end

	private

		def edit_user_params
			params.require(:account).permit(:username, :password, :role)
		end

		def account_params
			params.require(:account).permit(:password, :password_confirmation)
		end
end