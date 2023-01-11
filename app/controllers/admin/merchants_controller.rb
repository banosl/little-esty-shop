module Admin
  class Admin::MerchantsController < ApplicationController
    def index
      @top_5_merchants = Merchant.top_5_merchants_by_revenue
      @enabled_merchants = Merchant.find_by_status('enabled')
      @disabled_merchants = Merchant.find_by_status('disabled')
    end

    def show
      @merchant = Merchant.find(params[:id])
    end

    def edit 
      @merchant = Merchant.find(params[:id])
    end

    def update 
      current_merchant = Merchant.find(params[:id])

      if params[:status].present? && 
        current_merchant.update(merchant_params)

        current_merchant.save 

        redirect_back fallback_location: "/admin/merchants#{current_merchant.name}"
      else 
        current_merchant.update(merchant_params)

        current_merchant.save

        redirect_to "/admin/merchants/#{current_merchant.id}"
        flash[:alert] = "Merchant information successfully updated."
      end
    end

    def new 
      @merchant = Merchant.new
    end

    def create 
      merchant = Merchant.create(merchant_params) 
      merchant.save
      redirect_to admin_merchants_path
    end

private 

    def merchant_params
      params.require(:merchant).permit(:status, :name)
    end
  end
end