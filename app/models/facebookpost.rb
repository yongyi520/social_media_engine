class Facebookpost < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :body, presence: true



end
