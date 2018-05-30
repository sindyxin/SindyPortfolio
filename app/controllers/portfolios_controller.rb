class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.all
  end
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  def new
    @portfolio_item = Portfolio.new

    #word build here is instantiate three versions/type of this portfolio item with technologies
    3.times { @portfolio_item.technologies.build }

  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html {
          redirect_to portfolios_path, notice: "Update successfully"
        }
      else
        format.html { render :edit }
      end
    end 
  end

  def show 

  end

  def destroy
    #perform the lookup

    #destroy the record
    @portfolio_item.destroy
    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end
end


  



private

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle, 
                                        :body, 
                                        technologies_attributes: [:name]
                                        )
    end
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
