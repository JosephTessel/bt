require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'john'
    last_name 'cena'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    # after :create do |b|
    #   b.update_column(:image, "desktop/images for site/free.jpg")
    # end
  end
end
