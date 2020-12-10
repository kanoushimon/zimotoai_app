class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウントの有効化"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "送信"
  end
end