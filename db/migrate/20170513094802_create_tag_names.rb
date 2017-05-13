class CreateTagNames < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_names do |t|
      t.column :name, :string, limit: 128, null: false

      t.timestamps
    end
  end
end
