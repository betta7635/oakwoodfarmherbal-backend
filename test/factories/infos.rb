FactoryBot.define do
  factory :info do
    primaryCommonName { "MyString" }
    photoImagePath { "MyString" }
    formattedScientificName { "MyString" }
    color { "MyString" }
    duration { "MyString" }
    source { "MyString" }
    description { "MyText" }
    uses { "MyText" }
    conservationInfo { "MyText" }
    notes { "MyText" }
    plant { nil }
    seed_share { nil }
  end
end
