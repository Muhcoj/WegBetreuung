class Kontoumsaetze < ApplicationRecord

  validates_presence_of :weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo
end
