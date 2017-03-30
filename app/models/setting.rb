# RailsSettings Model
class Setting < RailsSettings::Base
  source Rails.root.join("config/app.yml")
  namespace Rails.env
  class<<self
  	def sso_enabled?
  	  return true
	   return false if self.sso_provider_enabled?
	   
    end

    def base_url
      "http://localhost:3000"
      # [self.protocol, self.domain].join('://')
    end

    def sso_provider_enabled?
	   self.sso['enable_provider'] == true
    end
    
    def protocol
      self.https == true ? 'https' : 'http'
    end

    
  end
  
end
