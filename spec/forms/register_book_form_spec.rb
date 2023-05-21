require 'rails_helper'

RSpec.describe RegisterBookForm, :type => :model do
  describe "バリエーションのテスト" do
    it "有効なファクトリを持つこと" do
      @register_book_form = FactoryBot.build(:register_book_form)
      @register_book_form.valid?
      expect(@register_book_form.errors).to be_empty
    end

    it "user_idが空の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, user_id: nil)
      @register_book_form.valid?
      expect(@register_book_form.errors[:user_id]).to include("ユーザーIDが未入力です")
    end

    it "titleが空の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, title: nil)
      @register_book_form.valid?
      expect(@register_book_form.errors[:title]).to include("タイトルが未入力です")
    end

    it "titleが50文字以上の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, title: "a" * 51)
      @register_book_form.valid?
      expect(@register_book_form.errors[:title]).to include("50文字以内で入力してください")
    end

    it "authorが空の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, author: nil)
      @register_book_form.valid?
      expect(@register_book_form.errors[:author]).to include("著者が未入力です")
    end

    it "authorが50文字以上の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, author: "a" * 51)
      @register_book_form.valid?
      expect(@register_book_form.errors[:author]).to include("50文字以内で入力してください")
    end

    it "page_countが空の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, page_count: nil)
      @register_book_form.valid?
      expect(@register_book_form.errors[:page_count]).to include("ページ数が未入力です")
    end

    it "isbn_10が空の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, isbn_10: nil)
      @register_book_form.valid?
      expect(@register_book_form.errors[:isbn_10]).to include("ISBN-10が未入力です")
    end

    it "isbn_10が10文字でない場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, isbn_10: "0" * 9)
      @register_book_form.valid?
      expect(@register_book_form.errors[:isbn_10]).to include("10桁で入力してください")
    end

    it "isbn_13が空の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, isbn_13: nil)
      @register_book_form.valid?
      expect(@register_book_form.errors[:isbn_13]).to include("ISBN-13が未入力です")
    end

    it "isbn_13が13文字でない場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, isbn_13: "1" * 12)
      @register_book_form.valid?
      expect(@register_book_form.errors[:isbn_13]).to include("13桁で入力してください")
    end

    it "categoryが空の場合、無効であること" do
      @register_book_form = FactoryBot.build(:register_book_form, category: nil)
      @register_book_form.valid?
      expect(@register_book_form.errors[:category]).to include("カテゴリーが未入力です")
    end
  end

  describe "メソッドのテスト" do
    it "#saveが常にtrueを返すこと" do
      expect(FactoryBot.build(:register_book_form).save).to be_truthy
    end
  end
end
