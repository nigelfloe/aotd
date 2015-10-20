class AlbumMailer < ApplicationMailer
  def album_email(user)
    @user = user
    mail(to: @user.email, subject: "AotD ?/?")
  end
end
