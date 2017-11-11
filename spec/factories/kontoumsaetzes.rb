FactoryBot.define do
  factory :kontoumsaetze do
    weg 3
    wertstellung "08.08.2017"
    umsatzart "Gutschrift"
    buchungsdetails "Referenz 9562231945DI"
    auftraggeber "ANNEGRET"
    empfaenger "Klaus-Dieter"
    betrag "100.20"
    saldo "12000.80"
  end
end
