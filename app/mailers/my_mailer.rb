class MyMailer < Devise::Mailer
  helper :application #gives access to all application helpers
  include Devise::Controllers::UrlHelpers
  default from: 'no-reply@blocipedia.com'
  default template_path: 'devise/mailer' #mailer will use default devise views

  def new_user(user)
    headers["Welcome"] = "Welcome to Blocipedia!"

    @user = user
    @email = @user.email

    mail(to: user.email, subject: "Welcome to Blocipedia!")
  end
end
