Sequel.migration do
  up do
  	alter_table :articles do
  		add_column :published?, TrueClass, default: false
  	end
  end

  down do
  end
end
