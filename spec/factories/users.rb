FactoryGirl.define do
  factory :user do
    email Faker::Internet.safe_email
    password 'password'

    trait :admin do
      role 'admin'
    end

    trait :aditor do
      role 'editor'
    end

  end
end
