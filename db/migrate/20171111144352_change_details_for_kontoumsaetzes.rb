class ChangeDetailsForKontoumsaetzes < ActiveRecord::Migration[5.1]
  def change
    change_column :kontoumsaetzes, :betrag, :decimal, precision: 8, scale: 2
    change_column :kontoumsaetzes, :saldo, :decimal, precision: 8, scale: 2
  end
end
