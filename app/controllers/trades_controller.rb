class TradesController < ApplicationController
  def new
    @trade = Trade.new
    @category = Category.find(params[:category_id])
    return unless @category.author != current_user

    flash[:alert] = 'These categories are not yours'
    redirect_to categories_path
  end

  def create
    @category = Category.find(params[:category_id])

    if @category.author != current_user
      flash[:alert] = 'You can only create trades from your categories'
      redirect_to categories_path
    end

    if trade_params[:category_ids].length == 1
      flash[:alert] = 'Must select at least one category'
      redirect_to new_category_trade_path(@category)
    else
      @category = Category.find(params[:category_id])
      @trade = Trade.new(trade_params)
      @trade.author = current_user

      if @trade.save
        flash[:notice] = 'trade created successfully'
        redirect_to @category
      else
        flash[:alert] = 'trade was not created'
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:name, :amount, category_ids: [])
  end
end
