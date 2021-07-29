FactoryBot.define do
  factory :task do
    name { "MyString" }
    content { "MyString" }
    aasm_state { "MyString" }
    priority { "MyString" }
    user { nil }
    end_date { "2021-07-29 16:44:16" }
  end
end
