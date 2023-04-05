class StaticPagesController < ApplicationController
  def index
    @user = User.new
    @book_count = Book.group(:title, :thumbnail).order("count_all DESC").count
  end
end
