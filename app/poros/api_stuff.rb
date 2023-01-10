# require 'httparty'
# require 'pry'
# require 'json'
# require './app/poros/repo.rb'

# response = HTTParty.get("https://api.github.com/repos/banosl/little-esty-shop")
# parsed = JSON.parse(response.body, symbolize_names: true)

# @repo = Repo.new(parsed)
# binding.pry

