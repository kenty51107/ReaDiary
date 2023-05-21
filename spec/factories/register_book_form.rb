FactoryBot.define do
  factory :register_book_form do
    user_id { 1 }
    title { "test_book" }
    author { "test_author" }
    published_date { "2023-01-01" }
    publisher { "test_publisher" }
    description { "test_description" }
    thumbnail { "test_thumbnail" }
    page_count { 1 }
    isbn_10 { "0" * 10 }
    isbn_13 { "1" * 13 }
    done_up_to { 1 }
    rating { 1 }
    status { 0 }
    category { "無分類" }
    headline { "" }
    content { "" }
  end
end
