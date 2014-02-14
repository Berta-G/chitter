require 'bcrypt'
require 'dm-validations'

class User 
	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, 							Serial
	property :email, 						String, :unique => true
	property :password_digest, 	Text
  property :name, 						String
  property :username,					String, :unique => true

  validates_confirmation_of :password

  def password=(password)
		@password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end