class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.string :aasm_state
      t.string :priority
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :end_date

      t.timestamps
    end
  end
end
