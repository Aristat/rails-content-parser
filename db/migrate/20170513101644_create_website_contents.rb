class CreateWebsiteContents < ActiveRecord::Migration[5.0]
  def change
    create_table :website_contents do |t|
      t.column :name, :string, limit: 128, null: false
      t.column :website_id, :integer, null: false
      t.column :tag_name_id, :integer, null: false

      t.timestamps
    end

    add_foreign_key :website_contents, :websites, column: 'website_id'
    add_foreign_key :website_contents, :tag_names, column: 'tag_name_id'

    add_index :website_contents, :website_id
  end
end
