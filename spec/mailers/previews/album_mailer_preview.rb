# Preview all emails at http://localhost:3000/rails/mailers/album_mailer
class AlbumMailerPreview < ActionMailer::Preview
  def album_email_preview
    AlbumMailer.album_email(User.first)
  end
end
