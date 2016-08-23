json.extract! tweet, :id, :status, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)