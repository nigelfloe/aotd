class AlbumMailer < ApplicationMailer
  def album_email(user)
    @user = user
    mg_client = Mailgun::Client.new(ENV['api_key'])
    message_params = {
      from:     ENV['gmail_username'],
      to:       @user.email,
      subject:  'AotD test email (Mailgun)',
      text:     "I hope this works :)"
    }
    mg_client.send_message(ENV['domain'], message_params)
  end
end
