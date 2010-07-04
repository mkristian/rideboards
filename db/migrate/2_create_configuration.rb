require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
migration 2, :create_configuration do
  up do
    Ixtlan::Rails::Migrations.create_configuration
  end

  down do
  end
end
