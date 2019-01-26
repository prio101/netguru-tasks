class Comment < ApplicationRecord
  validate :validate_user
  validates_presence_of :comment
  validates_length_of :comment, maximum: 255, minimum: 1

  belongs_to :user
  belongs_to :movie

  def validate_user
    errors.add(:user_id, "has One Comment") if Comment.where(user_id: self.user_id, movie_id: self.movie_id).count >= 1
  end
end
