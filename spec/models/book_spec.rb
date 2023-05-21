require 'rails_helper'

RSpec.describe Book, type: :model do
  it "ファクトリで関連するデータを生成すること" do
    book = FactoryBot.create(:book)
    puts "This book's user is #{book.user.inspect}"
  end
end
