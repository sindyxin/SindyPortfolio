class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

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
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html {
          redirect_to portfolios_path, notice: "Update successfully"
        }
      else
        format.html { render :edit }
      end
    end 
  end

  def show 
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
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
      params.require(:portfolio).permit(:title,:subtitle, :body)
    end