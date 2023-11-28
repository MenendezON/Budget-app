class TradesController < ApplicationController
  def new
    @trade = Trade.new
    @categories = Category.where(user: current_user)
  end

  def create
    puts 'step 1: initiate'
    @trade = current_user.trades.new(trades_params.except(:category_ids))
    puts 'step 2 '
    puts @trade
    @trade.author_id = current_user
    puts 'step 3'
    puts @trade.author_id
    @categories = Category.where(id: trades_params[:category_ids])
    puts 'step 4'
    puts @categories
    @categories.each do |category|
      @trade.categories << category
    end
    if @trade.save
      flash[:success] = 'Successfully added New Expenditure.'
      redirect_to category_path(Category.find_by(id: @categories.first.id))
    else
      flash.now[:error] = 'Error: Failed to Add new Expenditure!'
      render :new
    end
  end

  private

  def trades_params
    params.require(:trade).permit(:name, :amount, category_ids: [], category_id: [])
  end
end
