class GithubRepo
  attr_reader :name, :owner
  def initialize(repo_params)
    @name = repo_params["name"]
    @owner = GithubUser.new(repo_params["owner"])
  end
end