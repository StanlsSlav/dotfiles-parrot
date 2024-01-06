#!/usr/bin/env ruby

require 'optparse'
require 'logger'
require 'http'
require 'json'
require 'pathname'

options = {
  logger: Logger.new($stdout)
}
options[:logger].level = Logger::INFO

OptionParser.new do |opt|
  opt.on('-r REPO') do |repo|
    options[:repo] = repo

    cache_dir = '.cache'
    Dir.mkdir cache_dir unless Dir.exist? cache_dir

    safe_repo_name = repo.sub('/', '_')
    options[:cache_file] = File.join(cache_dir, safe_repo_name)

    options[:use_cached_file] = File.exist? options[:cache_file] unless File.zero? options[:cache_file]
    options[:api_url] = "https://api.github.com/repos/#{repo}/releases"
  end

  opt.on('-e REGULAR_EXPRESSION') do |re|
    options[:re] = Regexp.new re
  end

  opt.on('-d DIRECTORY') do |dir|
    options[:dir] = File.join('/opt', dir)
    Dir.mkdir options[:dir] unless Dir.exist? options[:dir]
  end

  opt.on('-m MODE') do |mode|
    options[:mode] = Integer(mode) unless mode.empty?
  end

  options[:verbose] = false
  opt.on('-v') do |verbose|
    options[:verbose] = verbose
    options[:logger].level = Logger::DEBUG
  end
end.parse!

options[:logger].debug "Options: #{options}"

def get_cached_response(options)
  cache_file = options[:cache_file]
  options[:logger].debug "Using cached response '#{cache_file}'"

  File.read(cache_file)
end

def cache_response(response, options)
  File.open(options[:cache_file], 'w') do |file|
    file.chmod(0o664)
    JSON.dump(response, file)

    options[:logger].debug 'Response cached'
  end
end

def get_github_assets(options, force_request: false)
  contents = if options[:use_cached_file] && !force_request
               get_cached_response(options)
             else
               options[:logger].debug 'Request forced' if force_request
               res = HTTP.get(options[:api_url]).to_s
               cache_response(res, options)
               res
             end

  # Weird behavior, JSON.dump creates a json string instead of object
  # Double parsing parses the string as expected, an array
  JSON.parse(JSON.parse(contents)).first['assets']
end

def get_matching_assets(options)
  assets = get_github_assets(options)
  assets = get_github_assets(options, force_request: true) if assets.empty?

  assets.select do |asset|
    name = asset['name']
    options[:logger].debug "Checking asset '#{name}'"
    next unless options[:re].match? name

    asset
  end
end

def save_response_to_file(res, file_path, options)
  File.write(file_path, res.to_s)
  options[:logger].debug "File #{file_path} saved"

  mode = options[:mode]
  File.chmod(mode, file_path) unless mode.nil? || mode.zero?
end

def get_response(options)
  options[:logger].debug 'Checking latest release'

  get_matching_assets(options).each do |asset|
    name = asset['name']

    download_url = URI.parse(asset['browser_download_url'])
    output_file = File.join(options[:dir], name)

    options[:logger].info "Downloading '#{name}' to '#{output_file}'"
    res = HTTP.follow.get(download_url)

    save_response_to_file(res, output_file, options)
  end
end

get_response(options)
options[:logger].info 'Done'
