# capistrano-db-tasks configuration

# if you want to remove the local dump file after loading
set :db_local_clean, false

# if you want to remove the dump file from the server after downloading
set :db_remote_clean, true

# if you want to exclude table from dump
tables = []
if (additional_tables = ENV["ADDITIONAL_DB_IGNORE_TABLES"])
  tables += additional_tables.split(",").map(&:strip)
end

set :db_ignore_tables, tables

# if you want to exclude table data (but not table schema) from dump
data_tables =
  if %w[1 t true].include?(ENV["DISREGARD_DB_IGNORE_DATA_TABLES_DEFAULTS"])
    []
  else
    [:activity_logs, :delayed_jobs, :import_logs, :imports, :kit_logs,
     :milestones, :pg_search_documents, :pickups, :purchase_order_line_items,
     :purchase_order_receipt_line_items, :purchase_order_receipts,
     :purchase_orders, :serial_numbers, :statistics, :transmission_events,
     :transmissions, :versions, :site_design_child_components, :site_design_components,
     :site_design_contact_informations, :site_design_custom_attributes,
     :site_design_designs, :site_design_locations, :site_design_site_scopes,
     :site_design_sites, :site_design_sublocations, :site_design_technologies,
     :site_design_validations, :inventory_logs, :http_log_entries]
  end

if (additional_data_tables = ENV["ADDITIONAL_DB_IGNORE_DATA_TABLES"])
  data_tables += additional_data_tables.split(",").map(&:strip)
end
set :db_ignore_data_tables, data_tables

# If you want to import assets, you can change default asset dir (default = system)
# This directory must be in your shared directory on the server
set :assets_dir, %w(public/assets public/att)
set :local_assets_dir, %w(public/assets public/att)

# if you want to work on a specific local environment (default = ENV['RAILS_ENV'] || 'development')
set :locals_rails_env, "production"

# if you are highly paranoid and want to prevent any push operation to the server
set :disallow_pushing, true

# if you prefer bzip2/unbzip2 instead of gzip
# set :compressor, :bzip2
