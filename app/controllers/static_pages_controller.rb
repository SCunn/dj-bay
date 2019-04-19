class StaticPagesController < ApplicationController
  def home
    @items = Item.all
  end

  def help
  end

  def about
  end
  
  def paid
    #recieve the id pameter from the url
    @order = Order.find_by(id: params[:id])
    @order.update_attribute(:status, "Paid by User: #{current_user.email}")
  end
end
