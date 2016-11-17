class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :typ
      t.string :category
      t.integer :amount
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
