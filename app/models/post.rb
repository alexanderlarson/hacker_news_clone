class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  has_many :users, through: :comments
end
