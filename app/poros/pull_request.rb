class PullRequest 
  attr_reader :id, 
              :user

  def initialize(data) 
    @id = data[:id]
    @user = data[:user]
  end
end