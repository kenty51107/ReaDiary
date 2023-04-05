class RecordsController < ApplicationController
  def index
    @records = Record.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @record = Record.find(params[:record_id])
    @new_record = @record.book.records.new
  end

  def create
    # book = current_user.books.find_by(id: record_params[:book_id])
    @new_record = Record.new(record_params)
    if @new_record.save!
      redirect_to user_path(current_user.id), notice: "読書記録を更新しました。"
    else
      flash.notice = "読書記録を更新できませんでした。"
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    # rec = record_edit_params.dup
    # if rec[:done_up_to] == @record.book.page_count.to_s
    #   rec[:finished] = true
    #   if @record.update(rec)
    #     flash.now.notice = 'お疲れ様でした。'
    #   else
    #     render 'edit', status: :unprocessable_entity
    #   end
    # elsif @record.update(record_edit_params)
    #   flash.now.notice = '読書記録を更新しました。'
    # else
    #   render 'edit', status: :unprocessable_entity
    # end
  end

  private

  def record_params
    params.require(:record).permit(:book_id, :done_up_to, :finished, :headline, :content, :category)
  end

  def record_edit_params
    params.require(:record).permit(:done_up_to, :finished)
  end
end