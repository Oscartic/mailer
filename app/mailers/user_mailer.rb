class UserMailer < ApplicationMailer
# SENDING EMAILS USING ACTIONMAILER AND MAIGUN THROUGH SMTP
#
# default from: "oscartic@example.cl"
#   # Subject can be set in your I18n file at config/locales/en.yml
#   # with the following lookup:
#   #
#   #   en.user_mailer.registration_confirmation.subject
#   #
#   def registration_confirmation(user)
#     @user = user
#     mail(to: @user.email, subject: "Registration confirmation")
#   end
#
# SENDING MAIL USING ACTIONMAILER AND MAIGUN THROUGH MAILGUN'S APIs
# Note: To use first add gem 'mailgun-ruby'

  def registration_confirmation(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {
        :from => ENV['mail_admin'],
        :to => @user.email,
        :subject => 'Contacto desde orb.cl',
        :text => 'This mail is sent using Mailgun API via mailgun-ruby'
    }
    mg_client.send_message ENV['domain'], message_params
  end
end
