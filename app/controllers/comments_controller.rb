class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.board
    else
      redirect_to comment.board, flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    respond_to do |format|
      format.html { redirect_to comment.board, notice: 'コメントが削除されました', status: :see_other }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
