class RepliesController < ApplicationController
  def create
    @reply = Reply.new(reply_params)
    if @reply.save!
      redirect_to record_path(@reply.record_id), notice: "コメントを投稿しました。"
    else
      flash.notice = "コメントを投稿できませんでした。"
      redirect_to record_path()
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:comment, :user_id, :record_id)
  end
end
