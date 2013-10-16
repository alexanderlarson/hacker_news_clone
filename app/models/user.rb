require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :authored_posts, class_name: "Post", foreign_key: :author_id
  has_many :comments
  has_many :posts, through: :comments

  validates :email, uniqueness: true
          
    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end

end
