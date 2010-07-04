require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
migration 1, :create_user do
  up do
    Ixtlan::Rails::Migrations.create_user
  end

  down do
  end
end
