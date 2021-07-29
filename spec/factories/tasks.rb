FactoryBot.define do
  factory :task do
    name { "MyString" }
    content { "MyString" }
    aasm_state { "MyString" }
    priority { "MyString" }
    user { nil }
    end_date { "2021-07-29 17:28:59" }
  end
end
