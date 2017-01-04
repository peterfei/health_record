class AccountsController < ApplicationController
	before_action :authenticate_account!

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
		def account_params
			params.require(:account).permit(:password, :password_confirmation)
		end
end