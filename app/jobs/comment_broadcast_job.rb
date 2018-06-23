class CommentBroadcastJob < ApplicationJob
  #a queue here when it comes to web socket is essentially saying that we want to have a list
  queue_as :default
  def perform(comment)
      ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)

  end

  private
  def render_comment(comment)
    CommentsController.render partial: "comments/comment", locals: { comment: comment }
  end
end