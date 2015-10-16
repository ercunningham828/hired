class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :status
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
