class WikiPolicy < ApplicationPolicy
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    @wiki.public?
  end
end
