class UserMailer < ActionMailer::Base
  default from: "Elusive Index <no-reply@elusiveindex.com>"

  def congratulations_email(user)
  	@user = user
  	mail(:to => @user.email, :subject => "You're on the list!")
  end
end
