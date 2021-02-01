class ChangeColumnToNotNull < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :age, :string, null: true
  end

  def down
    change_column :users, :age, :string
  end
end
