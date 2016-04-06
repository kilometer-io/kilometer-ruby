require_relative 'kilometer/version'
require 'date'
require 'net/http'
require 'json'
require 'uri'

module Kilometer

  class EventsAPIClient
    # Use Kilometer::EventsAPIClient to track events and manage users properties.

    HEADER_CUSTOMER_APP_ID = 'Customer-App-Id'
    HEADER_TIMESTAMP = 'Timestamp'
    HEADER_CLIENT_TYPE = 'Client-Type'
    HEADER_CONTENT_TYPE = 'Content-Type'
    CLIENT_TYPE = 'ruby'
    CONTENT_TYPE = 'application/json'

    def initialize(token, endpoint_url=nil)
      @token = token
      @endpoint_url = endpoint_url || 'http://events.kilometer.io'
    end

    public

    # Creates a new identified user if he doesn't exist.
    #
    #     user_id: identified user's ID
    #     headers: custom request headers (if isn't set default values are used)
    #     endpoint_url: where to send the request (if isn't set default value is used)
    def add_user(user_id, headers=nil, endpoint_url=nil)

      uri = URI("#{endpoint_url || @endpoint_url}/users")

      Net::HTTP.start(uri.host, uri.port) do |http|

        request = Net::HTTP::Post.new(uri.request_uri)

        # Set headers
        if headers
          headers.each { |header, value| request.add_field(header, value) }
        else
          self.set_default_headers(request)
          request.add_field(HEADER_CONTENT_TYPE, CONTENT_TYPE)
        end

        # Set payload
        request.body = {user_id: user_id}.to_json

        # Execute the request
        http.request(request)
      end
    end

    # Send an identified event. If a user doesn't exist it will create one.
    #
    #    user_id: identified user's ID
    #    event_name: event name (e.g. "visit_website")
    #    event_properties: properties that describe the event's details
    #    headers: custom request headers (if isn't set default values are used)
    #    endpoint_url: where to send the request (if isn't set default value is used)
    def add_event(user_id, event_name, event_properties=nil, headers=nil, endpoint_url=nil)

      uri = URI("#{endpoint_url || @endpoint_url}/events")

      Net::HTTP.start(uri.host, uri.port) do |http|

        request = Net::HTTP::Post.new(uri.request_uri)

        # Set headers
        if headers
          headers.each { |header, value| request.add_field(header, value) }
        else
          self.set_default_headers(request)
          request.add_field(HEADER_CONTENT_TYPE, CONTENT_TYPE)
        end

        # Set payload
        request.body = {
            user_id: user_id,
            event_name: event_name,
            event_type: 'identified',
            event_properties: event_properties || {}
        }.to_json

        # Execute the request
        http.request(request)
      end
    end

    # Increase a user's property by a value.
    #
    #    user_id: identified user's ID
    #    property_name: user property name to increase
    #    value: amount by which to increase the property
    #    headers: custom request headers (if isn't set default values are used)
    #    endpoint_url: where to send the request (if isn't set default value is used)
    def increase_user_property(user_id, property_name, value=0, headers=nil, endpoint_url=nil)
      inc_or_dec_user_property('increase', user_id, property_name, value, headers, endpoint_url)
    end

    # Decrease a user's property by a value.
    #
    #    user_id: identified user's ID
    #    property_name: user property name to decrease
    #    value: amount by which to decrease the property
    #    headers: custom request headers (if isn't set default values are used)
    #    endpoint_url: where to send the request (if isn't set default value is used)
    def decrease_user_property(user_id, property_name, value=0, headers=nil, endpoint_url=nil)
      inc_or_dec_user_property('decrease', user_id, property_name, value, headers, endpoint_url)
    end

    # Update a user's properties with values provided in "user_properties" dictionary
    #
    #   user_id: identified user's ID
    #   user_properties: user properties to update with a new values
    #   headers: custom request headers (if isn't set default values are used)
    #   endpoint_url: where to send the request (if isn't set default value is used)
    def update_user_properties(user_id, user_properties, headers=nil, endpoint_url=nil)

      uri = URI("#{endpoint_url || @endpoint_url}/users/#{user_id}/properties")

      Net::HTTP.start(uri.host, uri.port) do |http|

        request = Net::HTTP::Put.new(uri.request_uri)

        # Set headers
        if headers
          headers.each { |header, value| request.add_field(header, value) }
        else
          self.set_default_headers(request)
          request.add_field(HEADER_CONTENT_TYPE, CONTENT_TYPE)
        end

        # Set payload
        request.body = user_properties.to_json

        # Execute the request
        http.request(request)
      end


    end

    # Gets Net::HTTP request instance and modifies it by adding default HTTP headers.
    #
    # WARNING: The method modifies the #request object!
    def set_default_headers(request)
      request.add_field(HEADER_CUSTOMER_APP_ID, @token)
      request.add_field(HEADER_CLIENT_TYPE, CLIENT_TYPE)
      request.add_field(HEADER_TIMESTAMP, Kilometer::now)
    end

    private

    def inc_or_dec_user_property(action, user_id, property_name, value=0, headers=nil, endpoint_url=nil)

      uri = URI("#{endpoint_url || @endpoint_url}/users/#{user_id}/properties/#{property_name}/#{action}/#{value}")

      Net::HTTP.start(uri.host, uri.port) do |http|

        request = Net::HTTP::Post.new(uri.request_uri)

        # Set headers
        if headers
          headers.each { |header, value_| request.add_field(header, value_) }
        else
          self.set_default_headers(request)
        end

        # Execute the request
        http.request(request)
      end
    end

  end

  # Get current timestamp in milliseconds
  def self.now
    DateTime.now.strftime('%Q')
  end
end