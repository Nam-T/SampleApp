FactoryBot.define do
  factory :user do
    id {1}
    name {"Joe"}
    email {"joeeeee@gmail.com"}
    password_digest {"blahhhh"}
  end

  factory :authorization do
    provider {"facebook"}
    uid {"MyString"}
    user_id {1}
  end

  factory :micropost do
    id {1}
    content {"My String"}
    user_id {1}
  end

  factory :comment do
    id {1}
    content {"My String"}
    user_id {1}
    micropost_id {1}
    # parent_id {0}
  end

  factory :reply do
    id {2}
    content {"My String"}
    user_id {1}
    micropost_id {1}
    parent_id {1}
  end

  factory :invalid_comment, parent: :comment do
    content {nil}
  end
end
