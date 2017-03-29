# RailsSettings Model
class BbsConfig < RailsSettings::Base
  source Rails.root.join("config/app.yml")
  namespace Rails.env
end
