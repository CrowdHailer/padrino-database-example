Sequel.migration do
  up do
  	create_table :articles do
  		primary_key :id
  		String :body
  	end
  end

  down do
  	drop_table :articles
  end
end
