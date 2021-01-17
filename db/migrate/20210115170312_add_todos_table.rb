class AddTodosTable < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.text :text, null: false
      t.boolean :is_completed, null: false, default: false
      t.references :project, null: false, index: true

      t.timestamps
    end
  end
end
