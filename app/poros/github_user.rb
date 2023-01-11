class GithubUser 
  attr_reader :name, :total_commits

  def initialize(user_params, total_commits = "unknown") 
    @name = user_params["login"]
    @total_commits = total_commits
  end
end