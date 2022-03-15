json.extract! sq, :id, :sqtype_id, :name, :pic, :description, :created_at,
              :updated_at
json.url sq_url(sq, format: :json)
