class Kontoumsaetze < ApplicationRecord
  belongs_to :user

  validates_presence_of :weg, :wertstellung, :umsatzart, :buchungsdetails, :auftraggeber, :empfaenger, :betrag, :saldo

end
