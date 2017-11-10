FactoryBot.define do
  factory :post do
    date Date.today
    title "Title one"
    content "Some Content"
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    title "Title Two"
    content "Some more Content"
  end
end