# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title, null: false
      t.string :sub_title
      t.datetime :due_date
      t.integer :priority, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
