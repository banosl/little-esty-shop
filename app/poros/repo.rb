class Repo
  attr_reader :name
  def initialize(parsed)
    @name = parsed[:name]
  end
end