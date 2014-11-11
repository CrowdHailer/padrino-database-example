Sequel.migration do
  up do
  	alter_table :articles do
  		add_column :headline, String, null: false, unique: true
  	end
  end

  down do
  	alter_table :articles do
  		drop_column :headline
  	end
  end
end
