Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["twitter_api_key"], ENV["twitter_api_secret"]
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :pinterest, Rails.application.secrets.pinterest_app_id, Rails.application.secrets.pinterest_app_secret
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :tumblr, Rails.application.secrets.tumblr_api_key, Rails.application.secrets.tumblr_api_secret
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["facebook_api_id"], ENV["facebook_api_secret"],
           scope: 'publish_actions, user_posts'
end

