class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.string :expense_category
      t.date :date
      t.string :payment_method
      t.string :site
      t.decimal :cost
      t.text :notes

      t.timestamps
    end
  end
end
