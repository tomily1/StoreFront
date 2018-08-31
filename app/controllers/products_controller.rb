class ProductsController < ApplicationController

  def new
  end

  def create
    command = Commands::CreateProduct.new(product_params)
    if command.execute
      redirect_to root_path, notice: "product created successfully"
    else
      render :new
    end
  end

  private

  def product_params
    params.permit(:name, :details, :size, :price)
  end
end
