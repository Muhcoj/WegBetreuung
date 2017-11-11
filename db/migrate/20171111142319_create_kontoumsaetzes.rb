class CreateKontoumsaetzes < ActiveRecord::Migration[5.1]
  def change
    create_table :kontoumsaetzes do |t|
      t.integer :weg
      t.string :wertstellung
      t.string :umsatzart
      t.string :buchungsdetails
      t.string :auftraggeber
      t.string :empfaenger
      t.decimal :betrag, precision: 5, scale: 2
      t.decimal :saldo, precision: 5, scale: 2

      t.timestamps
    end
  end
end
