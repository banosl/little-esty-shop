class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discounts = @merchant.bulk_discounts
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