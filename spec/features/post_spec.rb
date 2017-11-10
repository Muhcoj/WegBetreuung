require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Don", last_name: "Johnson")
      login_as(user, :scope => :user)
      visit posts_path 
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(title: "Some Title", content: "Some description post1",date: Date.today)
      post2 = Post.create(title: "Some Title", content: "Some description post2", date: Date.today)
      visit posts_path
      expect(page).to have_content(/post1|post2/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Don", last_name: "Johnson")
      login_as(user, :scope => :user)
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