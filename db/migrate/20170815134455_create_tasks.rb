class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name

      t.timestamps
    end
  end
end


# batch 103 solution is with:
# t.string :title
# t.text :details
# t.boolean :completed, default: false
