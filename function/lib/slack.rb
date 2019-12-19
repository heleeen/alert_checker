require 'json'
require 'net/http'
require 'uri'
require_relative './message'

# TODO FIX
uri = URI.parse(ENV['SLACK_WEBHOOK_URL'])
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

http.start do
  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data(payload: @messages.to_json)
  http.request(request)
end

sleep 10
