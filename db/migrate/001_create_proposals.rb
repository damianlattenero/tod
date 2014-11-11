migration 1, :create_proposals do
  up do
    create_table :proposals do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :description, DataMapper::Property::Text
      column :author, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :proposals
  end
end
