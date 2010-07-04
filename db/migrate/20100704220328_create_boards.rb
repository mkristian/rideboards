migration 20100704220328, :create_boards do
  up do
    create_table :boards do
      column :id, Integer, :serial => true
      column :name, String, :nullable => false, :length => 255
      column :fullname, String, :nullable => false, :length => 255
      column :position, Integer, :nullable => false
      column :enabled, ::DataMapper::Types::Boolean, :nullable => false
      column :created_at, DateTime, :nullable => false
      column :updated_at, DateTime, :nullable => false
      column :created_by_id, Integer, :nullable => false
      column :updated_by_id, Integer, :nullable => false
    end
  end

  down do
    drop_table :boards
  end
end
