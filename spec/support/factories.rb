FactoryGirl.define do
  factory :idea do
    title
    body 'this is an idea bro'
  end

  sequence :title do |num|
    "this is idea ##{num}"
  end
end
