class ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end
  
  def show
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
  end
  
  def update
    merchant = Merchant.find(params[:merchant_id])
    item = Item.find(params[:id])
    if item.update(item_params)
      if params[:status]
        item.save
        redirect_to "/merchants/#{merchant.id}/items"
      else
        redirect_to "/merchants/#{merchant.id}/items/#{item.id}"
        flash[:alert] = 'Item information has been successfully updated.'
      end
    else
      redirect_to "/merchants/#{merchant.id}/items/#{item.id}/edit"
      flash[:alert] = 'Item was not updated, please update one of the fields.'
    end
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.new
  end

  def create 
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.new(item_params)
    # item = merchant.items.new(name: params[:name],
    #                         description: params[:description],
    #                         unit_price: params[:unit_price])
                            # require 'pry'; binding.pry
    if item.save(item_params)
    # if item.save(new_item_params)
      redirect_to "/merchants/#{merchant.id}/items"
      # flash[:alert] = 'New item has been successfully created'
    else
      redirect_to new_merchant_item_path(merchant.id)
      flash[:alert] = 'Item was not created, please fill out all of the fields.'
    end
  end

  private

  def item_params 
    # params.permit(:name, :description, :unit_price, :status)
    params.require(:item).permit(:name, :description, :unit_price, :status)
    
  end
  
  # def new_item_params
  #   params.require(:item).permit(:name, :description, :unit_price, :status)
  # end
  
end