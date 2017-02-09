# AUTH_DETAILS = YAML.load_file("#{Rails.root}/config/authentication_details.yml")
AUTH_DETAILS = ENV['planner_api_key']
