require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @register_book_form = FactoryBot.build(:register_book_form, user_id: @user.id)
    sign_in @user
  end

  describe "#create" do
    it "記録が追加できること" do
      expect {
        @register_book_form.save
      }.to change(Record, :count).by(1)
    end
  end
end
