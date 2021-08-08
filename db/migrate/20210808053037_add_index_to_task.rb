class AddIndexToTask < ActiveRecord::Migration[6.0]
  def change
    add_index :tasks, :name
    add_index :tasks, :state
    add_index :tasks, :priority
  end
end
