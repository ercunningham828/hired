class AddCoverletterToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :coverletter, :string
  end
end
