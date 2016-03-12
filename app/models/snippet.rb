class Snippet < ActiveRecord::Base
  belongs_to :user

  def time_since_written
    time_elapsed = ((Date.today - created_at) / 1).round
      if time_elapsed < 1
        return "today."
      else
        return "#{time_elapsed} days ago."
      end
  end
end
