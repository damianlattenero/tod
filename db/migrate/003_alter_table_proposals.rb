migration 3, :create_session do
  up do
    create_table :proposals do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :description, DataMapper::Property::Text
      column :author, DataMapper::Property::String, :length => 255
      column :date, DataMapper::Property::DateTime
    end
  end

  down do
    change_table(:proposals) do |t|
      t.column :type,DataMapper::Property::Type
    end
    drop_table :proposals
  end
end
