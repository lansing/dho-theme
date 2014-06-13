#!/usr/bin/env ruby

# Dharma Overground theme build script
# written by Max Lansing (lansing@gmail.com)

require 'fileutils'

PRODUCT_NAME = "dho-theme"

BASE_DIR = File.dirname(__FILE__) + "/../"
STAGING_DIR = File.expand_path(BASE_DIR + "staging")
THEME_DIR = File.expand_path(BASE_DIR + "theme")
BUILD_DIR = File.expand_path(BASE_DIR + "build")
THEME_WAR = "#{STAGING_DIR}/pixelpress-theme-6.2.0.0.war"

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

File.delete(THEME_WAR) if File.exist?(THEME_WAR)
FileUtils.rm_r("#{BUILD_DIR}") if Dir.exist?(BUILD_DIR)
Dir.mkdir(BUILD_DIR)

zip_into.call(THEME_DIR, THEME_WAR)
zip_into.call(STAGING_DIR, "#{BUILD_DIR}/#{PRODUCT_NAME}.lpkg")

