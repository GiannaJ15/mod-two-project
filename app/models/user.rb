require 'bcrypt'
class User < ApplicationRecord

    has_many :comments
    has_many :pictures

  #   before_save { self.email = email.downcase }
  #     validates :name,  presence: true, length: { maximum: 50 }
  #     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #     validates :email, presence: true, length: { maximum: 255 },
  #                       format: { with: VALID_EMAIL_REGEX },
  #                       uniqueness: { case_sensitive: false }
  #   has_secure_password
  #   validates :password, presence: true, length: { minimum: 6 }
  #
  #   # Returns the hash digest of the given string.
  #   def User.digest(string)
  #     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                   BCrypt::Engine.cost
  #     BCrypt::Password.create(string, cost: cost)
  #   end
  # end
  #   # accepts_nested_attributes_for :pictures
    # has_secure_password

    def authenticate(plaintext_password)
     BCrypt::Password.new(self.password_digest) == plaintext_password
   end

   def password=(plaintext_password)
     self.password_digest = BCrypt::Password.create(plaintext_password)
   end
 end
    # def user_pictures
    #   # @picture = Picture.
    #   Picture.all.select do |picture|
    #     picture.user == self
    #   end
    # end
    # def received_comments
    #    self.pictures.map do |picture|
    #      picture.comments
    #    end
    #  end
