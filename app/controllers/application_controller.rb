<<<<<<< HEAD
class ApplicationController < ActionController::Base
  before_action :load_github_service
  
  def welcome
  end

  def load_github_service
    @github_service = GithubService.new
  end
end
