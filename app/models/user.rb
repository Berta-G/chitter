require 'bcrypt'
require 'dm-validations'

class User 
	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, 							Serial, :required => true
	property :email, 						String, :required => true, :unique => true
	property :password_digest, 	Text,		:required => true
  property :name, 						String,	:required => true
  property :username,					String, :required => true, :unique => true

  validates_confirmation_of :password

  def password=(password)
		@password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end