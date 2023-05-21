FactoryBot.define do
  factory :book do
    title { "test_book" }
    author { "test_author" }
    published_date { "2023-01-01" }
    publisher { "test_publisher" }
    description { "test_description" }
    thumbnail { "test_thumbnail" }
    page_count { 1 }
    isbn_10 { "0" * 10 }
    isbn_13 { "1" * 13}
    association :user
  end
end
