class DeliveryMethodsController < ApplicationController

  def index
    @delivery_methods = DeliveryMethod.all
  end

  def create
    item = params.permit(:name, :price)
    command = Commands::CreateDeliveryMethod.new item

    if command.execute
      redirect_to delivery_methods_path, notice: "created"
    else
      redirect_to delivery_methods_path, alert: "unable to create delivery methods"
    end
  end

  def destroy
    delivery = DeliveryMethod.find_by_id(params[:id])

    if delivery.destroy
      redirect_to delivery_methods_path, notice: "deleted"
    else
      redirect_to delivery_methods_path, notice: "unable to delete method"
    end
  end
end
