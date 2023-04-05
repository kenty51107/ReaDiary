class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @books = current_user.books.all
    @reading = current_user.books.where(id: Record.where(finished: false).select(:book_id)).page(params[:page]).per(10)
    @finished = current_user.books.where.not(id: Record.where(finished: false).select(:book_id)).page(params[:page]).per(10)
    @records = Record.all.order(created_at: :desc).page(params[:page]).per(10)
  end
end