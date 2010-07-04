migration 20100704220301, :create_board_configs do
  up do
    create_table :board_configs do
      column :id, Integer, :serial => true
      column :board_id, Integer, :nullable => false
      column :locale_id, Integer, :nullable => false
      column :map_url, String, :nullable => false, :length => 255
      column :directions_url, String, :nullable => false, :length => 255
      column :created_at, DateTime, :nullable => false
      column :updated_at, DateTime, :nullable => false
      column :created_by_id, Integer, :nullable => false
      column :updated_by_id, Integer, :nullable => false
    end
  end

  down do
    drop_table :board_configs
  end
end
