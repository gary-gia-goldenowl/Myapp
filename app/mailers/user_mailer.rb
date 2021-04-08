class UserMailer < ApplicationMailer
    default from: "18520824@gm.uit.edu.vn"

    def welcome_email(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: "Welcome")
    end
end
