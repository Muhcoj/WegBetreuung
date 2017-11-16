class Kontoumsaetze < ApplicationRecord
  belongs_to :user

  validates_presence_of :weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo
 
  def self.import(file)
    CSV.foreach(file.path, headers: true, col_sep: ';') do |row|
      Kontoumsaetze.create! row.to_hash
    end
  end
end
