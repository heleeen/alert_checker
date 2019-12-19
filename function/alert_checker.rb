def exec(event:, context:)
  $service_name = event['service'] # TODO Check
  Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
end
