class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :picture_tags
  has_many :tags, through: :picture_tags

  # 
  # def user_pictures
  #   self.user
  # end
end
