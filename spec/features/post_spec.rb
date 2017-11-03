require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
     visit posts_path 
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be created' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from a new form page' do
      fill_in 'post[title]', with: "Some Title"
      fill_in 'post[content]', with: "Some content asdfasdf"
      fill_in 'post[date]', with: Date.today
      click_on "Speicher"

      expect(page).to have_content("Some Title")
    end
  end
end