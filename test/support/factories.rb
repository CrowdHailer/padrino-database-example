FactoryGirl.define do
	# Factory Girl is made with Active Record in mind. It tries to use the 'save!' method.
	# Sequel only has save method and this addresses that
	to_create { |i| i.save }

	factory :article do
		sequence :headline do |number|
			"New news of the day: #{number}"
		end
		body 'Some content, maybe about hippos'
		trait :published do
			published? true			
		end
	end
end