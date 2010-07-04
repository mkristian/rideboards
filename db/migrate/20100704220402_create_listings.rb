migration 20100704220402, :create_listings do
  up do
    create_table :listings do
      column :id, Integer, :serial => true
      column :location, String, :nullable => false, :length => 255
      column :email, String, :nullable => false, :length => 255
      column :name, String, :nullable => false, :length => 255
      column :ridedate, Date, :nullable => false
      column :driver, ::DataMapper::Types::Boolean, :nullable => false
      column :password, String, :nullable => false, :length => 255
      column :created_at, DateTime, :nullable => false
      column :updated_at, DateTime, :nullable => false
      column :created_by_id, Integer, :nullable => false
      column :updated_by_id, Integer, :nullable => false
    end
  end

  down do
    drop_table :listings
  end
end
