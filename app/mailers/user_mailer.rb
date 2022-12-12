class UserMailer < ApplicationMailer
  default from: "abhishek_rastogi@softprodigy.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.singup_email.subject
  #
  def signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
