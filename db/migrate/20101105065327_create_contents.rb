class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.text :body
      t.integer :position
      t.string :code_language
      t.string :content_type
      t.boolean :hide
      t.boolean :deleting
      t.references :user
      t.references :pad

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
