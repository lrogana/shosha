json.extract! team, :id, :name, :team_contact_name, :team_contact_phone_number, :tournament_id, :created_at, :updated_at
json.url team_url(team, format: :json)
