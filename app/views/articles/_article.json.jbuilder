json.extract! article, :id, :journalist_id, :title, :description, :approved, :created_at, :updated_at
json.url article_url(article, format: :json)
