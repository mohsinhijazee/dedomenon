class AddDummyTable < ActiveRecord::Migration
  def self.up
   create_table :dummytable, :force => true do |t|
    t.column :parent_id,   :integer
    t.column :child_id,    :integer
    t.column :relation_id, :integer
  end

  def self.down
  drop_table :dummytable
  end
end
