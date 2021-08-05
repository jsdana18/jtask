class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name ,null: false
      t.string :content, null: false
      t.integer :state, default: 0
      t.integer :priority, default: 0
      # t.belongs_to :user, null: false, foreign_key: true
      t.datetime :end_date

      t.timestamps
    end
  end
end
