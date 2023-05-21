require 'rails_helper'

RSpec.describe User, type: :model do
  it "name, email, password, password_confirmationがあれば有効な状態であること" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    puts(user.errors.full_messages)
    expect(user.errors[:name]).to include("未入力です")
  end

  it "nameが30文字以内であること" do
    user = FactoryBot.build(:user, name: "a" * 31)
    user.valid?
    expect(user.errors[:name]).to include("30文字以内で入力してください")
  end

  it "emailがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("未入力です")
  end

  it "重複したemailなら無効な状態であること" do
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("このメールアドレスは既に登録済みです。")
  end

  it "passwordがなければ無効な状態であること" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("未入力です")
  end

  it "passwrodが6文字以上であること" do
    user = FactoryBot.build(:user, password: "a" * 5)
    user.valid?
    expect(user.errors[:password]).to include("6文字以上で入力してください")
  end
end
