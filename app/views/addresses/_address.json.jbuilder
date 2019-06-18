json.extract! address, :id, :phone, :address_line_1, :address_line_2, :city, :country, :zip_code, :created_at, :updated_at
json.url address_url(address, format: :json)
