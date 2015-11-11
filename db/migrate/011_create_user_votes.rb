migration 11, :create_user_votes do
  up do
    create_table(:user_votes) do
      column :id, Integer, :serial => true
      column :value, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :user_votes
  end
end
