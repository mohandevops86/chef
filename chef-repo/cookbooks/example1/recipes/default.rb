#
# Cookbook:: example1
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

puts 'Hello World'

if `ps -ef | grep java | grep -v grep` != ""
    puts "Java Process Running"
else
    puts "Java Process Not Running"
end

log 'message' do
  message 'Hello World from log resource'
  level :fatal
end

log 'message' do
  message 'NEW Message from 0.1.1'
  level :fatal
end

URL_DATA = data_bag_item('deployments', 'URL' )
puts URL_DATA['key']

include_recipe 'app::install'
