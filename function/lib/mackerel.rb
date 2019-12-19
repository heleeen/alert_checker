load_paths = Dir["./vendor/bundle/gems/**/lib"]
$LOAD_PATH.unshift(*load_paths)

require 'mackerel/client'

## TODO ENV
mackerel = Mackerel::Client.new(:mackerel_api_key => ENV['MACKEREL_API_KEY'])
alerts = mackerel.get_alerts()
@org_name = mackerel.get_organization().name
@alerts = ""

if alerts.length > 0 then
  monitors = mackerel.get_monitors().to_ary

  alerts.each{ |alert|
    monitor = monitors.find { |item| item.id == alert.monitorId }
    if alert.hostId.nil?
      # TODO title_link
      # FIXME?
      @alerts << "*#{monitor.name}* \n https://mackerel.io/orgs/#{@org_name}/alerts/#{alert.id} \n" if monitor.service == $service_name
    else
      host = mackerel.get_host(alert.hostId)
      @alerts << "*#{monitor.name}* \n https://mackerel.io/orgs/#{@org_name}/alerts/#{alert.id} \n" if host.roles.keys.first == $service_name
    end
  }
end
