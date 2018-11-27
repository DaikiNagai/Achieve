class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :edit, :update]
  def create
      @comment = current_user.comments.build(comment_params)
      @blog = @comment.blog
      @notification = @comment.notifications.build(user_id: @blog.user_id)
      respond_to do |format|
        if @comment.save
          format.html {redirect_to blog_path(@blog), notice: 'コメントを投稿しました。'}
          format.js {render :index}
          unless @comment.blog.user_id == current_user.id
            Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'comment_created',{
                message: 'あなたの作成したブログにコメントが付きました！'
              })
            Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'notification_created', {
            unread_counts: Notification.where(user_id: @comment.blog.user_id, read: false).count
          })
          end
        else
          format.html {render :new}
        end
      end
  end

  def destroy
    @blog = @comment.blog
    @comment.destroy
    respond_to do  |format|
      format.html {redirect_to blog_path(@blog), notice: 'コメントを削除しました。'}
      format.js {render :index}
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    @blog = @comment.blog
    respond_to do |format|
      if @comment.save
        format.html {redirect_to blog_path(@blog), notice: 'コメントを編集しました。'}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
