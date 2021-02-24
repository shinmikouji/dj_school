FactoryBot.define do
  factory :reservation do
    name { "MyString" }
    start_time { "2100-01-01 09:30:00" }
    user
    menu
  end
end
