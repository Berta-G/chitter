Then(/^the peep "(.*?)" is created$/) do |title|
	expect(Peep.first(:title => title)).not_to eq(nil)
end

Then(/^the peep "(.*?)" is not created$/) do |title|
	expect(Peep.first(:title => title)).to eq(nil)
end

Given(/^some peeps are created$/) do
		user = User.first(:username => "Pepe")
		Peep.create(title: "Title 1", text: 'text', user: user)
		Peep.create(title: "Title 2", text: 'text', user: user)
end

