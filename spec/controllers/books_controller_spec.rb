require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "#create" do
    context "ログインしている場合" do
      it "本が追加できること" do
        @register_book_form = FactoryBot.build(:register_book_form, user_id: @user.id)
        sign_in @user
        expect {
          @register_book_form.save
        }.to change(@user.books, :count).by(1)
      end

    end

    context "ログインしていな場合" do
      it "本が追加できないこと" do
        @register_book_form = FactoryBot.build(:register_book_form)
        expect {
          @register_book_form.save
        }.to change(Book, :count).by(0)
      end
    end
  end

  describe "#delete" do
    before do
      @register_book_form = FactoryBot.build(:register_book_form, user_id: @user.id)
      sign_in @user
      @register_book_form.save
      @book = @user.books.last
    end

    it "本を削除できること" do
      expect {
        @book.destroy
      }.to change(@user.books, :count).by(-1)
    end
  end
end
