json.extract! contact, :id, :firstname, :lastname, :email, :import_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)