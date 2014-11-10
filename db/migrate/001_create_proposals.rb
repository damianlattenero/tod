migration 1, :create_proposals do
  up do
    create_table :proposals do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :proposals
  end
end
