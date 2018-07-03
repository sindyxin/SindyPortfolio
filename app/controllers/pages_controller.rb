class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def new_skill
    @skill = Skill.new
  end
  def create_skill
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to about_me_path, notice: 'Skill was successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def contact
  end
  
  def tech_news
    @tweets = SocialTool.twitter_search
  
  end
  private
  def skill_params
    params.require(:skill).permit(:title, :percent_utilized)
  end
end
