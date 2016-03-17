class AssIsSiteToUser < ActiveRecord::Migration
    def change
      add_column :users, :is_site, :boolean, :default => false
      add_column :users, :site_name, :string
      add_column :users, :site_slug, :string
      add_column :users, :site_level, :integer, :default => 0
    end
end
