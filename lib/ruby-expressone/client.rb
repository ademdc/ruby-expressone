require 'rest-client'
require 'json'
require "base64"

module RubyExpressOne
  class Client
  
    attr_reader :api_key, :with_logger

    def initialize(api_key, with_logger: false)
      @api_key = api_key
      @with_logger = with_logger
    end

    def action(path, http_method: :post, payload: {}, query_params: {})
      begin 
        response = ::RestClient::Request.execute(
          method: http_method,
          url: full_url(path, query_params),
          payload: payload.to_json,
          headers: headers,
          timeout: 5,
          verify_ssl: ::OpenSSL::SSL::VERIFY_NONE
        )
      rescue => e
        return parse(e.response)
      end

      parse(response)
    end

    private

    def headers
      {
        'User-Agent': "Ruby In Time client v#{RubyExpressOne::VERSION})",
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    end

    def full_url(path, query_params={})
      query_params.merge!(ApiKey: api_key)
      query_string = hash_to_query(query_params)
      
      "#{base_url}#{path}?#{query_string}"
    end

    def parse(response)
      success       = (200..308).to_a.include?(response.code.to_i) ? true : false
      hash_response = JSON.parse(response.body) rescue response.body

      struct_response.new(success, hash_response)
    end

    def struct_response
      Struct.new(:success?, :hash_response)
    end

    def print_log(log, debug_type: :info)
      if with_logger
        RubyExpressOne.config.logger.send debug_type, "<---- #{log} ----->"
      end
    end

    def base_url
      'http://webapi.expressone.ba/api/data'
    end

    def hash_to_query(query_params)
      query_params.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&")
    end
  end
end