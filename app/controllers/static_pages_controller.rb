class StaticPagesController < ApplicationController
  def index
    @user = User.new
    @book_lists = Book.group(:title, :thumbnail, :author, :isbn_10).order("count_all DESC").limit(5).count
    @highly_rated_books = Book.joins(:records).where(records: { status: 2 }).group(:title, :thumbnail, :author, :isbn_10).order("avg(records.rating) DESC").limit(5).pluck(:title, :thumbnail, :author, :isbn_10, "avg(records.rating)")
    @latest_reviews = Record.where(status: 2).order(created_at: :desc).limit(5)
    logger.debug("###########{@highly_rated_books}##########")
  end
end
