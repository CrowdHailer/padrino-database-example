FactoryGirl.define do
	# Factory Girl is made with Active Record in mind. It tries to use the 'save!' method.
	# Sequel only has save method and this addresses that
	to_create { |i| i.save }

	factory :article do
		body 'Some content, maybe about hippos'
	end
end