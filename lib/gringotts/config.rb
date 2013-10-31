module Gringotts
  
  class Config
    
    cattr_reader :enabled, :twilio
    
    def self.load(raw_yaml)
      begin
        yaml = YAML.load(raw_yaml)
      rescue Exception => e
        raise "Unable to load YAML."
      end
      
      @@enabled = parse(yaml, "enabled")
      @@twilio  = parse(yaml, "twilio", false)
    end
    
    def self.parse(yaml, node, required = true)
      value = yaml[Rails.env][node.to_s]
      raise "Missing required value for [#{node}] in config/gringotts.yml" if required && value.nil?
      return value
    end
    
  end
  
end