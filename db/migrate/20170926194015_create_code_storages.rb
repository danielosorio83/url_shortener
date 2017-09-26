class CreateCodeStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :code_storages do |t|
      t.string :code
      t.integer :lock_version

      t.timestamps
    end
  end
end
