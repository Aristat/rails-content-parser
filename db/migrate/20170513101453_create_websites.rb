class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.column :url, :string, limit: 128, null: false

      t.timestamps
    end
  end
end
