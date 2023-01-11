require 'httparty'
require 'pry'
require 'json'
require './app/poros/repo_search.rb'

search = RepoSearch.new
pull_request = search.pull_request_info
# require 'pry'; binding.pry
pull_request

