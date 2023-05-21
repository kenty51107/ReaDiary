require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "#index" do
    it "正常にレスポンスを返すこと" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
