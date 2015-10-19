class AddSlugToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :slug, :string
    add_index :applications, :slug, unique: true
  end
end
