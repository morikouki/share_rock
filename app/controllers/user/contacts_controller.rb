class User::ContactsController < ApplicationController

	def create
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		contact.save
		ContactMailer.send_contact(current_user, contact).deliver_now
		redirect_to user_user_path(current_user)
	end

	private

	def contact_params
		params.require(:contact).permit(:title, :contents)
	end
end
