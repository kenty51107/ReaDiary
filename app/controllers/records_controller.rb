class RecordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @records = Record.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @record = Record.find(params[:id])
    @reply = @record.replies.new
    @replies = Reply.where(record_id: @record.id).order(created_at: :desc)
  end

  def new
    @record = Record.find(params[:record_id])
    @finished_flag = params[:finished_flag]
    @new_record = @record.book.records.new
  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    @new_record = Record.new(record_params)
    if check_finished?(record_params[:book_id], record_params[:done_up_to], record_params[:finished])
      @new_record[:finished] = true
    end

    if @new_record.save
      redirect_to user_path(current_user.id), notice: "読書記録を更新しました。" unless @new_record[:finished]
      redirect_to user_path(current_user.id), notice: "この本を読み終えました。おつかれさまでした！" if @new_record[:finished]
    else
      flash.notice = "読書記録を更新できませんでした。"
      redirect_to user_path(current_user.id)
    end
  end

  private

  def check_finished?(book_id, done_up_to, finished)
    unless finished
      page_count = Book.find(book_id).page_count
      if done_up_to.to_s == page_count.to_s
        return true
      end
    end
  end

  def record_params
    params.require(:record).permit(:book_id, :done_up_to, :finished, :headline,
                                    :content, :category, :rate)
  end

  def record_edit_params
    params.require(:record).permit(:done_up_to, :finished)
  end
end
