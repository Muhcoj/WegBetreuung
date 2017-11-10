require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'can be created' do
     expect(@post).to be_valid
    end

    it 'cannot be created without title, content and date.' do
      @post.title = nil
      @post.content = nil
      @post.date = nil
      expect(@post).to_not be_valid
    end
  end
end
