json.extract! input, :id, :email, :firstname, :lastname, :language, :proficiency, :created_at, :updated_at
json.url input_url(input, format: :json)
