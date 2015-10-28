class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    @user = user
    AlbumMailer.album_email(@user).deliver_later
  end
end
