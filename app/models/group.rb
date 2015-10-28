class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  def slug
    name.downcase.scan(/\w+/).join('-')
  end

  def create_mailing_list
    RestClient.post("https://api:#{ENV['api_key']}" \
                    "@api.mailgun.net/v3/lists",
                    address: email,
                    name: name,
                    description: description)
  end
end
