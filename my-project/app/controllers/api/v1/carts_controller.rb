class Api::V1::CartsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :get_cart, only: [:show, :edit, :update]

      def index
        @carts = Cart.all
        @products = @carts.collect do |cart|
          { cart_id: cart.id, product:  Product.find(cart.product_id) }
        end
        render json: @products
      end

      # def show
      #   @cart = Cart.find(params[:id])
      # end

      def new
        @cart = Cart.new
      end

      # def create
      #   @cart = Cart.create(cart_params)
      #   redirect_to @cart
      # end

      def create
        @cart = Cart.new(cart_params)
          if @cart.valid?
            @cart.save
            render json: @cart
          else
            render :new
          end
      end

      # def edit
      # @cart = Cart.find(params[:id])
      # end

      # def update
      #   @cart.update(cart_params)
      #   redirect_to @cart
      # end

      def update
          if @cart.update(cart_params)
            render json: @cart
          else
            render :edit
          end
      end

      def destroy
        Cart.destroy(params[:id])
        render json: @products
      end

      private

      def get_cart
        @cart = Cart.find(params[:id])
      end

      def cart_params
        params.require(:cart).permit(:price, :user_id, :product_id)
      end

end
