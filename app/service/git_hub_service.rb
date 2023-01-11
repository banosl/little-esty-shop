class GitHubService
  def get_url(url)

    token = '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'
    response = HTTParty.get(url, headers: { "Authorization" => "Bearer #{token}"})
    JSON.parse(response.body, symbolize_names: true)
    # response = HTTParty.get(url)
    # JSON.parse(response.body, symbolize_names: true)
  end

  def parse_repo
    get_url("https://api.github.com/repos/banosl/little-esty-shop")
  end

  def parse_closed_pull_requests
    get_url("https://api.github.com/repos/banosl/little-esty-shop/pulls?state=closed")
  end
end
