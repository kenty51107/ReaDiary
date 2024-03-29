class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @reading_books = @user.books.joins(:records).group(:id).having("MAX(records.status) = 0")
  end

  def finished_books
    @user = User.find(params[:id])
    @books = @user.books.all
    @finished_books = @user.books.joins(:records).where(records: { status: [1, 2] }).distinct
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.following
    render "relationships/show_follow"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'relationships/show_follow'
  end
end
