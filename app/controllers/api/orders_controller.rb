module Api
  class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token

    # {
    #   {
    #     "author_id",
    #     "file"
    #   }
    # }
    def create
      @order = Order.new(order_params)

      respond_to do |format|
        if @order.save
          head :ok
        else
          render json: @order.errors.to_s
        end
      end
    end

    private

    def order_params
      params.permit(:author_id, :file)
    end
  end
end
