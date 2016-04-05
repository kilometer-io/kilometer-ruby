require_relative 'kilometer/version'
require 'date'

module Kilometer
  class EventsAPIClient
    # Use Kilometer::EventsAPIClient to track events and manage users properties.


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

    # Creates a new identified user if he doesn't exist.
    #
    #     user_id: identified user's ID
    #     headers: custom request headers (if isn't set default values are used)
    #     endpoint_url: where to send the request (if isn't set default value is used)
    def add_user(user_id, headers=nil, endpoint_url=nil)
      endpoint_url = endpoint_url || @endpoint_url

      url = "#{endpoint_url}/users"
    end

    # Send an identified event. If a user doesn't exist it will create one.
    #
    #    user_id: identified user's ID
    #    event_name: event name (e.g. "visit_website")
    #    event_properties: properties that describe the event's details
    #    headers: custom request headers (if isn't set default values are used)
    #    endpoint_url: where to send the request (if isn't set default value is used)
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

  # Get current timestamp in milliseconds
  def self.now
    DateTime.now.strftime('%Q')
  end
end