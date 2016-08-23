json.extract! tumblrpost, :id, :user_id, :title, :body, :created_at, :updated_at
json.url tumblrpost_url(tumblrpost, format: :json)