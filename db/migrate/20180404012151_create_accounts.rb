class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :person_type
      t.references :advisor, foreign_key: true

      t.timestamps
    end
  end
end
