migration 12, :create_proposal_file do
  up do
    modify_table :proposals do
      add_column :file, DataMapper::Property::FilePath
    end
  end

  down do
    drop_table :proposals
  end
end
