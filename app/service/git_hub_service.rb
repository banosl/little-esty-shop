class GitHubService
  def get_url(url)
    response = HTTParty.get(url)
    JSON.parse(response.body, symbolize_names: true)

  end

  def parse_repo
    get_url("https://api.github.com/repos/banosl/little-esty-shop")
  end

  
end
