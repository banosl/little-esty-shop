require 'httparty'
require 'pry'
require 'json'
require './app/poros/repo_search.rb'

search = RepoSearch.new
repo = search.repo_info
repo.name
binding.pry

