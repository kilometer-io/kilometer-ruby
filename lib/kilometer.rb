require_relative 'kilometer/version'

module Kilometer
  class EventsAPIClient
    @@HEADER_CUSTOMER_APP_ID = 'Customer-App-Id'
    @@HEADER_TIMESTAMP = 'Timestamp'
    @@HEADER_CLIENT_TYPE = 'Client-Type'
    @@HEADER_CONTENT_TYPE = 'Content-Type'
    @@CLIENT_TYPE = 'ruby'
    @@CONTENT_TYPE = 'application/json'

    def initialize(token, endpoint_url=nil)
      @token = token
      @endpoint_url = endpoint_url || 'https://events.kilometer.io'
    end

    public

    def add_user(user_id, headers=nil, endpoint_url=nil)
      endpoint_url = endpoint_url || @endpoint_url

      url = "#{endpoint_url}/users"
    end

    def add_event(user_id, event_name, event_properties=nil, headers=nil, endpoint_url=nil)
      endpoint_url = endpoint_url || @endpoint_url

      url = "#{endpoint_url}/events"
    end

    def increase_user_property(user_id, property_name, value=0, headers=nil, endpoint_url=nil)
      endpoint_url = endpoint_url || @endpoint_url

      url = "#{endpoint_url}/users/#{user_id}/properties/#{property_name}/increase/#{value}"
    end

    def decrease_user_property(user_id, property_name, value=0, headers=nil, endpoint_url=nil)
      endpoint_url = endpoint_url || @endpoint_url

      url = "#{endpoint_url}/users/#{user_id}/properties/#{property_name}/decrease/#{value}"
    end

    def update_user_properties(user_id, user_properties, headers=nil, endpoint_url=nil)
      endpoint_url = endpoint_url || @endpoint_url

      url = "#{endpoint_url}/users/#{user_id}/properties"
    end
  end
end