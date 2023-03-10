class RecordsController < ApplicationController
  def index
    # @records = current_user.books.where(id: Record.where(finished: true).select(:book_id)).page(params[:page]).per(10)
    @records = Record.where(finished: true)
  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    @record = current_user.records.new(record_params)
    if @record.save
      logger.debug("レコードの保存成功 book_id : #{params[:record]}")
      redirect_to user_path(current_user.id), notice: "読書を開始できます。"
    else
      logger.debug("レコードの保存失敗")
      flash.now[:alert] = "読者開始できません"
      render 'show', status: :unprocessable_entity
    end
  end

  def update
    @record = Record.find(params[:id])
    rec = record_edit_params.dup
    if rec[:done_up_to] == @record.book.page_count.to_s
      rec[:finished] = true
      if @record.update(rec)
        flash.now.notice = 'お疲れ様でした。'
      else
        render 'edit', status: :unprocessable_entity
      end
    elsif @record.update(record_edit_params)
      flash.now.notice = '読書記録を更新しました。'
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record).permit(:book_id)
  end

  def record_edit_params
    params.require(:record).permit(:done_up_to, :finished)
  end
end