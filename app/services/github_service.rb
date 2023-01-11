require 'httparty'

class GithubService 
  
  def get_collaborators 
    response = HTTParty.get("#{base_uri}/collaborators", options)
    collaborators = response.map {|user| GithubUser.new(user)}
  end

  def get_repo
    GithubRepo.new(HTTParty.get(base_uri))
  end

  def get_contributor_commits
    response = HTTParty.get("#{base_uri}/stats/contributors", options)
    users = response.map do |stat|
      GithubUser.new(stat["author"], stat["total"])
    end

    u = users.select do |user|
      collabs = get_collaborators.map(&:name)
      collabs.include?(user.name)
    end
  end

  def get_total_pull_requests 
    HTTParty.get("#{base_uri}/pulls?state=closed", options).size
  end

  private 

  def base_uri 
    "https://api.github.com/repos/banosl/little-esty-shop"
  end

  def options
    {
      headers: {
        "Authorization": "Bearer #{ENV["GITHUB_ACCESS_KEY"]}",
        "X-GitHub-Api-Version": "2022-11-28"
      }
    }
  end
end