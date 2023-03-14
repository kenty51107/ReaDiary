class TestdbsController < ApplicationController
  def index
    @test = Testdb.new
  end
  def create
    @test = Testdb.new
    if @test.save
      redirect_to user_path(current_user.id), notice: "登録成功"
    else
      flash.now[:alert] = "保存失敗"
      render user_path(currnet_user.id), status: :unprocessable_entity
    end
  end
end
