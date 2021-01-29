json.extract! image, :id, :description, :instructions, :ingredients, :cookingtime, :created_at, :updated_at
json.url image_url(image, format: :json)
