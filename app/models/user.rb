class User < ActiveRecord::Base
  has_many :snippets
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable

  def line_order
    total_user_count = User.count
    initial_line = self.id + 25
    profile_bonus = 0
    if self.profile.about_me.length > 0
      profile_bonus = initial_line / 2
      # profile_bonus = 6
    end
    snippet_bonus = 0
    if self.snippets.count > 0
      snippet_bonus = initial_line / 2
      # snippet_bonus = 5
    end
    final_line = initial_line - profile_bonus - snippet_bonus
    final_line > 0 ? final_line : 1

  end
end
