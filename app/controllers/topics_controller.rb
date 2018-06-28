class TopicsController < ApplicationController
  before_action :topics_sidebar
  layout 'blog'
  def index 
    @topics = Topic.all 
  end    
  def show
    @topic = Topic.find(params[:id])
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.page(params[:page]).per(5).order(created_at: :desc)
    else 
      @blogs = @topic.blogs.published.page(params[:page]).per(5).order(created_at: :desc)
    end
  end
  def topics_sidebar 
    @sidebar_topics =  Topic.with_blogs
  end
end
