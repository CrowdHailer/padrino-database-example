Sequel.migration do
  up do
  	alter_table(:articles) do
  	  set_column_not_null :body
  	end
  end

  down do
  	alter_table(:articles) do
  	  set_column_allow_null :body
  	end
  end
end
