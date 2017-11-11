require 'rails_helper'

RSpec.describe Kontoumsaetze, type: :model do
  describe 'Creation' do
    before do
      @kontoumsaetze = Kontoumsaetze.create(weg: 3, wertstellung: "08.08.2017", umsatzart: "Gutschrift", buchungsdetails: "Referenz 9562231945DI", auftraggeber: "ANNEGRET", empfaenger: "Klaus-Dieter", betrag: 100.20, saldo: 12000.80)
    end

    it 'can be created' do 
      expect(@kontoumsaetze).to be_valid 
    end

    it 'cannot be created without weg, wertstellung, umsatzart, buchungsdetails, auftraggeber, empfaenger, betrag and saldo' do
      @kontoumsaetze.weg = nil
      @kontoumsaetze.wertstellung = nil
      @kontoumsaetze.umsatzart = nil
      @kontoumsaetze.buchungsdetails = nil
      @kontoumsaetze.auftraggeber = nil
      @kontoumsaetze.empfaenger = nil
      @kontoumsaetze.betrag = nil
      @kontoumsaetze.saldo = nil

      expect(@kontoumsaetze).to_not be_valid
    end
  end
end
