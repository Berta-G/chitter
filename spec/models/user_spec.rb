# require './app/models/user'
require 'spec_helper'

describe 'User' do
	let(:user) {User.new}
	let(:password) {'password'}

	it "cyphers the password" do
		expect(BCrypt::Password).to receive(:create).with(password).and_return('passord_digest')
		user.password = password
		expect(user.password_digest).not_to be(nil)
	end

	context "Authentication" do

		it "returns nil if incorrect credentials" do
				user.password = password
				user.username = 'Pepe'
				expect(User.authenticate('Pepe', 'wrong_password')).to eq(nil)
		end

		it "returns the user if correct credentials" do
				user.password = password
				user.username = 'Pepe'
				expect(User).to receive(:first).with(:username => 'Pepe').and_return(user)
				expect(BCrypt::Password).to receive(:new).and_return(password)
				expect(User.authenticate('Pepe', password)).to eq(user)
		end
	end


end
