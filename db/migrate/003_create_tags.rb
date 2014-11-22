migration 3, :create_tags do
  up do
    create_table :proposals_tags, :id => false do
    column :tag_id, Integer
    column :proposal_id, Integer
    end
  end

  down do
    drop_table :proposals_tags
  end
end