class RegistrationMailer < ApplicationMailer

	default from: "share_rock@example.com"
	def send_confirm_to_user(user)
	    @user = user
	    mail to: user.email,
	         subject: 'thank_you!'
    end
end
