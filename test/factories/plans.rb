FactoryBot.define do
  factory :plan do
    photoImagePath { "MyString" }
    planName { "MyString" }
    planLocation { "MyString" }
    planDescription { "MyText" }
    planNotes { "MyText" }
    user { nil }
  end
end
