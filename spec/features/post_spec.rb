require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

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

    it 'has a list of posts' do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/One|Two/)
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

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited from a edit form page' do
      visit edit_post_path(@post)

      fill_in 'post[title]', with: "Some Title edited"
      fill_in 'post[content]', with: "Some content asdfasdf edited"
      fill_in 'post[date]', with: Date.yesterday
      click_on "Speicher"

      expect(page).to have_content("Some Title edited")
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @post = FactoryBot.create(:post)
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end
end








