class Api::V1::ProductsController < ApplicationController

    before_action :find_product, only: [:update]
    skip_before_action :authorized, only: :index

    def index
      @products = Product.all
      render json: @products
    end

    def update
      @product.update(product_params)
      if @product.save
        render json: @product, status: :accepted
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessible_entity
      end
    end

    private

    def product_params
      params.permit(:id, :brand, :name, :price, :image_link, :product_link)
    end

    def find_product
      @product = Product.find(params[:id])
    end


end
