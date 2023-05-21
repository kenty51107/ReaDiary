require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
    end

    context "ログインしている場合" do
      it "正常にレスポンスを返すこと" do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to have_http_status "200"
      end
    end

    context "ゲストの場合" do
      it "302レスポンスを返すこと" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトすること" do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
