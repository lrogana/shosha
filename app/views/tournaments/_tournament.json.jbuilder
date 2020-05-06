json.extract! tournament, :id, :name, :tournament_date, :contact_name, :contact_phone_number, :user_id, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
