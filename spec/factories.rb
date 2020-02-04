FactoryBot.define do
  factory :user do
    name {"Joe"}
    email {"joeeeee@gmail.com"}
    password_digest {"blahhhh"}
  end

  factory :authorization do
    provider {"facebook"}
    uid {"MyString"}
    user_id {1}
  end
end