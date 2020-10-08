class ContactMailer < ApplicationMailer

	def send_contact(user, contact)
	    @user = user
	    @contact = contact
	    mail to: user.email,
	         subject: 'お問い合わせを受け付けました',
	         from: '"Share_Rock管理人" <form@example.com>'
    end
end
