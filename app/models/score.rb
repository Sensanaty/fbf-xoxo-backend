class Score < ApplicationRecord
  validates_uniqueness_of :username, message: "Sorry, %{value} has already been taken."
end
