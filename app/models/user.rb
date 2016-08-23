class User < ActiveRecord::Base

  require 'koala'
  def self.find_or_create_from_auth_hash(auth_hash)
    # look up the user or create them
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
            name: auth_hash.info.name,
            profile_image: auth_hash.info.image,
            token: auth_hash.credentials.token,
            secret: auth_hash.credentials.secret
    )
    if auth_hash.provider == "twitter"
      user.update(nickname: auth_hash.info.nickname)
    end
    user
  end

  def twitter
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_api_key"]
      config.consumer_secret     = ENV["twitter_api_secret"]
      config.access_token        = token
      config.access_token_secret = secret
    end
  end

  def facebook
    @facebook_client ||= Koala::Facebook::API.new(token)
  end

end
