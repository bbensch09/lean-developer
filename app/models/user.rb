class User < ActiveRecord::Base
  has_many :snippets
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable#, :confirmable

  def profile_bonus
    profile_bonus = 0
    if self.profile.about_me.length > 75
      profile_bonus = 10
    end
    profile_bonus
  end

  def snippet_bonus
    snippet_bonus = 0
    if self.snippets.count > 0
      snippet_bonus = 5
    end
    snippet_bonus
  end

  def points
    #free points
    #all users get a point for every user that signs up after them, so with 10 users, the 1st user gets 10 points, and the last user gets zero
    free_points = User.count - self.id
    total_points = free_points + self.profile_bonus + self.snippet_bonus
  end

  def rank
    all_users = User.all
    all_users_sorted = all_users.sort { |a,b| b.points <=> a.points}
    all_users_sorted.index(self) + 1
  end
end
