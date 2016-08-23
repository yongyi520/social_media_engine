json.extract! facebookpost, :id, :user_id, :body, :created_at, :updated_at
json.url facebookpost_url(facebookpost, format: :json)