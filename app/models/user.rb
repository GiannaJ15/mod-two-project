class User < ApplicationRecord
    has_many :comments
    has_many :pictures
    accepts_nested_attributes_for :pictures
    has_secure_password

    def password=(plaintext_password)
      self.password_digest = BCrpyt::Password.create(plaintext_password)
    end 

    # def user_pictures
    #   # @picture = Picture.
    #   Picture.all.select do |picture|
    #     picture.user == self
    #   end
    # end

end
