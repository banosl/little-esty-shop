class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discounts = @merchant.bulk_discounts
    load_holidays = NagerService.new
    @holidays = load_holidays.get_next_public_holidays
    # binding.pry

  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    new_discount = merchant.bulk_discounts.new(strong_params_bulk_discount)
    if new_discount.valid?
      new_discount.save
      redirect_to merchant_bulk_discounts_path(merchant.id)
    else
      redirect_to new_merchant_bulk_discount_path(merchant.id), notice: "Please enter valid data."
    end
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:merchant_id])
    discount = BulkDiscount.find(params[:id])
    
    if discount.update(strong_params_bulk_discount)
      redirect_to merchant_bulk_discount_path(merchant.id, discount.id)
    else
      redirect_to edit_merchant_bulk_discount_path(merchant.id, discount.id), notice: "Please enter valid data."
    end
  end

  def destroy
    merchant = Merchant.find(params[:merchant_id])
    discount = BulkDiscount.find(params[:id])
    discount.destroy
    redirect_to merchant_bulk_discounts_path(merchant.id)
  end

  private
  def strong_params_bulk_discount
    params.permit(:name, :percent_discount, :quantity_threshold)
  end
end