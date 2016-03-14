#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative './dispatch'

desc "Print grape routes"
task :routes do |t, args|
  format = "%7s %50s"
  API::Dispatch.routes.each do |grape_route|
    info = grape_route.instance_variable_get :@options 

    puts format % [
      info[:method],
      info[:path]
    ]

    if info[:params].length > 1
      info[:params].each_with_index do |param_info, index|
        next if index == 0
        puts format % ['','','','','',param_info.inspect]
      end
    end
  end
end
