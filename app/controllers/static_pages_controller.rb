class StaticPagesController < ApplicationController
  def index
    @user = User.new
    @book_lists = Book.group(:title, :thumbnail, :author, :isbn_10).order("count_all DESC").limit(5).count
    @highly_rated_books = Book.joins(:records).order(rating: :desc).limit(5)
    @latest_reviews = Record.where(status: 2).order(created_at: :desc).limit(5)
    logger.debug("###############{@book_lists}")
  end
end
