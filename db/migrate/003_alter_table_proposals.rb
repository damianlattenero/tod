migration 3, :create_session do
  up do
    modify_table(:proposals) do
      add_column :type, DataMapper::Property::SessionMapper
    end
  end

  down do
    drop_table :proposals
  end
end
