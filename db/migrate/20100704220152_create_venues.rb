migration 20100704220152, :create_venues do
  up do
    create_table :venues do
      column :id, Integer, :serial => true
      column :fullname, String, :nullable => false, :length => 255
      column :email, String, :nullable => false, :length => 255
      column :password, String, :nullable => false, :length => 255
      column :bcc, ::DataMapper::Types::Boolean, :nullable => false
      column :enabled, ::DataMapper::Types::Boolean, :nullable => false
      column :created_at, DateTime, :nullable => false
      column :updated_at, DateTime, :nullable => false
      column :created_by_id, Integer, :nullable => false
      column :updated_by_id, Integer, :nullable => false
    end
  end

  down do
    drop_table :venues
  end
end
