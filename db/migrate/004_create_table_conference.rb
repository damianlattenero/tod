migration 4, :create_conference do
  up do
    create_table :conference do
      column :id, Integer, :serial => true
      column :reviews_per_proposal, Numeric, required: true, :default => 3
    end
  end

  down do
    drop_table :conference
  end
end