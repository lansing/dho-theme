#!/usr/bin/env ruby

# Dharma Overground theme build script
# written by Max Lansing (lansing@gmail.com)

PRODUCT_NAME = "dho-theme"

BASE_DIR = File.dirname(__FILE__) + "/../"
STAGING_DIR = File.expand_path(BASE_DIR + "staging")
THEME_DIR = File.expand_path(BASE_DIR + "theme")
BUILD_DIR = File.expand_path(BASE_DIR + "build")

run_command = lambda do |c|
  puts c
  puts `#{c}`
end

zip_into = lambda do |dir, destination|
  starting_dir = Dir.pwd
  Dir.chdir(dir)
  run_command.call("find . -path '*/.*' -prune -o -type f -print | zip #{destination} -@")
  Dir.chdir(starting_dir)
end


zip_into.call(THEME_DIR, "#{STAGING_DIR}/pixelpress-theme-6.2.0.0.war")

zip_into.call(STAGING_DIR, "#{BUILD_DIR}/#{PRODUCT_NAME}.lpkg")

