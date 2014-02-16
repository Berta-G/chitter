Then(/^the peep "(.*?)" is created$/) do |title|
	expect(Peep.first(:title => title)).not_to eq(nil)
end