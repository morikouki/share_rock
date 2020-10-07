class RegistrationMailer < ApplicationMailer

	default from: "share_rock@example.com"
	def send_confirm_to_user(user)
	    @user = user
	    mail to: user.email,
	         subject: 'Share_rockへようこそ！',
	         from: '"Share_Rock管理人" <share_rock@example.com>'
    end
end
