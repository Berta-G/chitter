require './app/models/user'

describe 'User' do
	let(:user) {User.new}
	
	it "cyphers the password" do
		password = 'password'
		expect(BCrypt::Password).to receive(:create).with(password).and_return('passord_digest')
		user.password = password
		expect(user.password_digest).not_to be(nil)
	end


end
