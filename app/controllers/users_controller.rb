class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @finished_books = @books.joins(:records).where(records: {finished: true})
    @reading_books = @books - @finished_books
  end

  def finished_books
    @user = User.find(params[:id])
    @books = @user.books.all
    @finished_books = @books.joins(:records).where(records: {finished: true})
    @readings_books = @books - @finished_books
  end
end
