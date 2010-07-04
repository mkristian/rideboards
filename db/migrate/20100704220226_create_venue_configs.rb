migration 20100704220226, :create_venue_configs do
  up do
    create_table :venue_configs do
      column :id, Integer, :serial => true
      column :locale_id, Integer, :nullable => false
      column :venue_id, Integer, :nullable => false
      column :date_format, String, :nullable => false, :length => 255
      column :home_url, String, :nullable => false, :length => 255
      column :schedule_url, String, :nullable => false, :length => 255
      column :checklist_url, String, :nullable => false, :length => 255
      column :iframe_url, String, :nullable => false, :length => 255
      column :created_at, DateTime, :nullable => false
      column :updated_at, DateTime, :nullable => false
      column :created_by_id, Integer, :nullable => false
      column :updated_by_id, Integer, :nullable => false
    end
  end

  down do
    drop_table :venue_configs
  end
end
