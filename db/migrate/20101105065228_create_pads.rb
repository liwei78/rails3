class CreatePads < ActiveRecord::Migration
  def self.up
    create_table :pads do |t|
      t.references :user
      t.string  :title
      t.boolean :top, :default => false 
      t.integer :top_position, :default => 0 
      t.integer :share_count
      t.integer :reads_count
      t.boolean :private, :default => false 
      t.string  :cached_tag_list
      t.timestamps
    end
  end

  def self.down
    drop_table :pads
  end
end
