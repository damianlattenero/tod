migration 2, :create_proposal_administrators do
  up do
    create_table :proposal_administrators do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :proposal_administrators
  end
end
