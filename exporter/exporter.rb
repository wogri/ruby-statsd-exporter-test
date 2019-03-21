#!/usr/local/bin/ruby -w

require 'datadog/statsd'

STDOUT.sync = true
statsd = Datadog::Statsd.new('statsd_exporter', 9125)

puts 'exporter loaded. waiting for 5 seconds'
sleep 5

puts 'incrementing page.views'
statsd.increment('page.views')

sleep 20

puts 'batching an update'
statsd.batch do |s|
  s.increment('page.views')
  s.gauge('users.online', 123)
end


