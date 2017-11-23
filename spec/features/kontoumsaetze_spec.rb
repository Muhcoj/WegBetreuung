require "rails_helper"

describe 'navigate' do 
  before do
    @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Don", last_name: "Johnson")
    login_as(@user, :scope => :user)
  end

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

    it 'has a list of kontoumsätze' do
      kontoumsaetze1 = Kontoumsaetze.create(weg: 3, wertstellung: "08.08.2017", umsatzart: "Gutschrift", buchungsdetails: "Referenz 9562231945DI", auftraggeber: "ANNEGRET", empfaenger: "Klaus-Dieter", betrag: 100.20, saldo: 12000.80, user_id: @user.id)
      kontoumsaetze2 = Kontoumsaetze.create(weg: 1, wertstellung: "08.07.2017", umsatzart: "Gutschrift2", buchungsdetails: "Referenz 9562231945DI2", auftraggeber: "ANNEGRET2", empfaenger: "Klaus-Dieter2", betrag: 200.20, saldo: 22000.80, user_id: @user.id)
      visit kontoumsaetzes_path
      expect(page).to have_content(/Gutschrift|Gutschrift2/)
    end
  end

  describe 'creation' do
    before do
      logout(:user)
      admin_user = AdminUser.create(email: "admintest@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "User")
      login_as(admin_user, :scope => :user)
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

  describe 'edit' do
    before do
      @kontoumsaetze = Kontoumsaetze.create(weg: 3, wertstellung: "08.08.2017", umsatzart: "Gutschrift", buchungsdetails: "Referenz 9562231945DI", auftraggeber: "ANNEGRET", empfaenger: "Klaus-Dieter", betrag: 100.20, saldo: 12000.80, user_id: @user.id)
    end
    it 'can be reached by clicking edit on index page' do
      visit kontoumsaetzes_path

      click_link("edit_#{@kontoumsaetze.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited from a edit form page' do
      visit edit_kontoumsaetze_path(@kontoumsaetze)

      fill_in 'kontoumsaetze[weg]', with: 2
      fill_in 'kontoumsaetze[wertstellung]', with: "08.08.2017"
      fill_in 'kontoumsaetze[umsatzart]', with: "Edit Gutschrift"
      fill_in 'kontoumsaetze[buchungsdetails]', with: "Referenz 9562231945DI"
      fill_in 'kontoumsaetze[auftraggeber]', with: "ANNEGRET"
      fill_in 'kontoumsaetze[empfaenger]', with: "Klaus-Dieter"
      fill_in 'kontoumsaetze[betrag]', with: 300.20
      fill_in 'kontoumsaetze[saldo]', with: 32000.80
      click_on "Speichern"

      expect(page).to have_content("Edit Gutschrift")
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @kontoumsaetze = Kontoumsaetze.create(weg: 3, wertstellung: "08.08.2017", umsatzart: "Gutschrift", buchungsdetails: "Referenz 9562231945DI", auftraggeber: "ANNEGRET", empfaenger: "Klaus-Dieter", betrag: 100.20, saldo: 12000.80, user_id: @user.id)
      visit kontoumsaetzes_path

      click_link("delete_kontoumsaetze_#{@kontoumsaetze.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end
end











