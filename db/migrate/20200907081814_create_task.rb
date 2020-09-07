class CreateTask < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to  :user
      t.string      :description
      t.string      :status, default: :open
      t.boolean     :urgent, default: false
      t.boolean     :important, default: false
      t.datetime    :deleted_at

      t.timestamps
    end

    add_index :tasks, :deleted_at
  end
end
