class WikiPolicy < ApplicationPolicy
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    @wiki.public? || @wiki.user_id == @user.id || @wiki.users.include?(@user)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user
        if user.role == 'admin'
          wikis = scope.all #if the user is an admin, show them all the wikis
        elsif user.role == 'premium'
          all_wikis = scope.all
          all_wikis.each do |wiki|
            if wiki.public? || wiki.user_id == user.id || wiki.users.include?(user)
              wikis << wiki # if the user is premium, only show them wikis that are public, that they own, or that they are collaborators on
            end
          end
        else # standard user
          all_wikis = scope.all
          wikis = []
          all_wikis.each do |wiki|
            if wiki.public? || wiki.users.include?(user)
              wikis << wiki # only show standard users public wikis and private ones that they are collaborating on
            end
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.public?
            wikis << wiki
          end
        end
      end
      wikis # return the wikis array we've built - this will be displayed to the user
    end
  end
end
