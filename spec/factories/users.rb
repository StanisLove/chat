FactoryGirl.define do
  salt = "asdasdastr4325234324sdfds"

  factory :user do
    sequence(:email)    { |n| "user_#{n}@mail.com" }
    sequence(:username) { |n| "user_#{n}" }
    password "secret"
    password_confirmation "secret"
    salt salt
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret", salt) }
  end
end
