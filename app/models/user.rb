class User < ActiveRecord::Base
  has_many :queries
  has_many :posts
  
  validates :email, :password, :name, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => {:with => %r{^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$}i,:message => 'must be a valid e-mail id.'}
end
