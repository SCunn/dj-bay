json.extract! item, :id, :artist, :album, :image_url, :genre, :condition, :description, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
