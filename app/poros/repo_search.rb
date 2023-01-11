require './app/service/git_hub_service.rb'
require './app/poros/repo.rb'

class RepoSearch
  def repo_info
    data = service.parse_repo
    Repo.new(data)
  end

  def service
    GitHubService.new
  end
end