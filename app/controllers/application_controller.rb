require 'httparty'
require 'pry'
require 'json'
require './app/poros/repo_search.rb'

class ApplicationController < ActionController::Base
  before_action :repo
  
  def repo
    search = RepoSearch.new
    @repo = search.repo_info
    @pr_count = search.pull_request_info
  end
  
  def welcome
  end
  
end
