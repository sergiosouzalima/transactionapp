class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :equity
      t.string :kind
      t.decimal :value
      t.date :transaction_at
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
