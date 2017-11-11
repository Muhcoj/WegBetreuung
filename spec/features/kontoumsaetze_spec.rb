require "rails_helper"

describe 'navigate' do 
  describe 'index' do
    it 'can be reached successfully' do 
      visit kontoumsaetzes_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Kontoumsätze' do
      visit kontoumsaetzes_path
      expect(page).to have_content(/Kontoumsätze/)
    end
  end

  describe 'creation' do
    it 'has a new form that can be reached' do
      visit new_kontoumsaetze_path
      expect(page.status_code).to eq(200)
    end

    it 'can be created from a new form page' do
      visit new_kontoumsaetze_path

      fill_in 'kontoumsaetze[weg]', with: 2
      fill_in 'kontoumsaetze[wertstellung]', with: "08.08.2017"
      fill_in 'kontoumsaetze[umsatzart]', with: "Gutschrift"
      fill_in 'kontoumsaetze[buchungsdetails]', with: "Referenz 9562231945DI"
      fill_in 'kontoumsaetze[auftraggeber]', with: "ANNEGRET"
      fill_in 'kontoumsaetze[empfaenger]', with: "Klaus-Dieter"
      fill_in 'kontoumsaetze[betrag]', with: 300.20
      fill_in 'kontoumsaetze[saldo]', with: 32000.80
      click_on "Speichern"

      expect(page).to have_content("Referenz 9562231945DI")
    end
  end
end
