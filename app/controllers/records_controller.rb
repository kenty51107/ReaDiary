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
    @new_record[:status] = 1 if check_finished?
    @new_record[:status] = 2 if record_params[:status] == '1'
    if @new_record.save
      redirect_to current_user, notice: "読書記録を更新しました。" if @new_record[:status] == 0
      redirect_to current_user, notice: "この本を読み終えました。おつかれさまでした！" if @new_record[:status] == 1
      redirect_to finished_books_user_path(current_user.id), notice: "レビューを投稿しました。" if @new_record[:status] == 2
    else
      flash.now.notice = "読書記録を更新できませんでした。"
      @new_record.errors.full_messages.each do |message|
        logger.debug("###########{message}##########")
      end
      redirect_to current_user
      # render :new, status: :unprocessable_entity
    end
  end

  private

  def check_finished?
    return true if record_params[:status] == '0' && record_params[:done_up_to].to_i == Book.find_by(id: record_params[:book_id]).page_count.to_i

    false
  end

  def record_params
    params.require(:record).permit(:book_id, :done_up_to, :status, :headline,
                                   :content, :category, :rating)
  end

  def record_edit_params
    params.require(:record).permit(:done_up_to, :finished)
  end
end
