class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :code
      t.string :original_url

      t.timestamps
    end
    add_index :urls, :code, unique: true
    add_index :urls, :original_url, unique: true
  end
end
