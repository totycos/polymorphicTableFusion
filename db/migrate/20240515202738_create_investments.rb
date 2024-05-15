class CreateInvestments < ActiveRecord::Migration[7.0]
  def change
    create_table :investments do |t|
      t.references :investor, polymorphic: true, null: false
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.decimal :balance, precision: 10, scale: 2
      t.string :status
      t.string :transaction_type

      t.timestamps
    end
  end
end
