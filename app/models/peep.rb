require 'bcrypt'
require 'dm-validations'

class Peep
	include DataMapper::Resource

	property :id, 							Serial, 	:required => true
	property :title, 						String,		:required => true
	property :text, 						Text, 		:required => true
	property :created_at, 			DateTime
	property :updated_at,				DateTime

  has 1, :user, :through => Resource
end