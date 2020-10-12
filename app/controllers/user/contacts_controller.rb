class User::ContactsController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	def create
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		if contact.save
			#お問い合わせユーザーへメール送信
			ContactMailer.send_contact(current_user, contact).deliver_now
			redirect_to user_user_path(current_user)
		else
			flash[:error] = "空欄の項目があった為お問い合わせできませんでした。再度お問い合わせしてください。"
			redirect_to user_user_path(current_user)
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:title, :contents)
	end
end
