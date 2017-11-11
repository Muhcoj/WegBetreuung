require "rails_helper"

describe 'navigate' do 
  describe 'index' do
    before do
      visit kontoumsaetzes_path
    end

    it 'can be reached successfully' do 
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Kontoumsätze' do
      expect(page).to have_content(/Kontoumsätze/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Don", last_name: "Johnson")
      login_as(user, :scope => :user)
      visit new_kontoumsaetze_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from a new form page' do

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

    it 'will have a user associated with it' do
      fill_in 'kontoumsaetze[weg]', with: 2
      fill_in 'kontoumsaetze[wertstellung]', with: "08.08.2017"
      fill_in 'kontoumsaetze[umsatzart]', with: "User Gutschrift"
      fill_in 'kontoumsaetze[buchungsdetails]', with: "Referenz 9562231945DI"
      fill_in 'kontoumsaetze[auftraggeber]', with: "ANNEGRET"
      fill_in 'kontoumsaetze[empfaenger]', with: "Klaus-Dieter"
      fill_in 'kontoumsaetze[betrag]', with: 300.20
      fill_in 'kontoumsaetze[saldo]', with: 32000.80
      click_on "Speichern"

      expect(User.last.kontoumsaetzes.last.umsatzart).to eq("User Gutschrift")
    end
  end
end
