require './app/service/git_hub_service.rb'
require './app/poros/repo.rb'
require './app/poros/pull_request.rb'

class RepoSearch
  def repo_info
    data = service.parse_repo
    Repo.new(data)
  end

  def service
    GitHubService.new
  end

  def pull_request_info
    merged_pull_requests = service.parse_closed_pull_requests
    # require 'pry'; binding.pry
    merged_pull_requests_count = merged_pull_requests.count
  end
end