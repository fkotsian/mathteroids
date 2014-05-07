class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :question, null: true
      t.decimal :answer, null: true
      t.boolean :skipped, default: true
      t.boolean :answered, :default => false
      t.boolean :correct, :default => false

      t.string :type

      t.timestamps
    end

    add_index :problems, :question, unique: true
  end
end
