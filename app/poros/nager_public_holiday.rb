class NagerPublicHoliday
  attr_reader :name,
              :localname,
              :date
  def initialize(repo_params)
    @date = repo_params["date"]
    @localname = repo_params["localName"]
    @name = repo_params["name"]
  end
end