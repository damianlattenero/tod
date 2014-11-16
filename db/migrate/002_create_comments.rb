migration 2, :create_comments do
  up do
    create_table :comments do
      column :id, Integer, :serial => true
      column :author, DataMapper::Property::String, :length => 255
      column :body, DataMapper::Property::Text
      column :date, DataMapper::Property::DateTime
    end
  end

  down do
    drop_table :comments
  end
end
