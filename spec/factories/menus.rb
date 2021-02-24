FactoryBot.define do
  factory :menu do
    name { "MyString" }
    description { "MyText" }
    price { "MYInteger" }
    user
  end

  factory :menu_second, class: Menu do
    name { "SecondString" }
    description { "SecondText" }
    price { "SecoundInteger" }
    user
  end

  factory :menu_third, class: Menu do
    name { "ThirdString" }
    description { "ThirdText" }
    price { "ThirdInteger" }
    user
  end
end
