class CartController < ApplicationController
    before_action :authenticate_user!
    def add
        # get id of the product
        id = params[:id]
        # if the cart session is already created use existing session
        if session[:cart] then
            cart = session[:cart]
        else
            session[:cart] = {}
            cart = session[:cart]
        end
        # check if the product is already in cart, if so increment by 1
        
        if cart[id] then
            cart[id] = cart[id] + 1 # this is the actual increase quantity part
        else
            cart[id] = 1
        end
        
        redirect_to :action => :index
        
    end
    
    ############# Method to Decrease amount of items by 1 ##############
    
    def decrease
        
        id = params[:id]
        cart = session[:cart]
        if cart[id] == 1 then
            cart.delete id
        else
            cart[id] = cart[id]-1
        end
        #Taking us to cart index[view] page
        redirect_to :action => :index
    
    
    
    end
    
    
    
    ########### Start of remove item from cart method #############
    
    def remove
        id = params[:id]
        cart = session[:cart]
        cart.delete id
        
        redirect_to :root
    end
    
    ############# Clear cart method ##################
    
    def clearCart
        # clear cart and remove all items
        session[:cart] = nil
        
        redirect_to :action=> :index
        
        
    end
    
    
    
    
    
    ########### Start of Index logic ################    
    def index
        
        # pass the cart information to the index view
        if session[:cart] then
            @cart = session[:cart]
        else
            @cart = {}
        end
            
    end
    
    
     def createOrder
        # step 1 find out who is actually placing the order
        @user = User.find(current_user.id)
    
           # Step 2 actually make the order we wnt to keep in our database
           @order = @user.order.build(:order_date => DateTime.now, :status => "Pending")
           @order.save
           
           # Step 3 - Take all items from current cart and associate them with the order
           
           @cart = session[:cart] || {} # This gets the content from the current shopping cart
            
        
        @cart.each do |id, quantity| 
          
          item = Item.find_by_id(id)
          
          @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.album, :description => item.description, :quantity => quantity, :price => item.price)
          @orderitem.save
        end
        
            @orders = Order.all
        
        
            @orderitems = Orderitem.where(order_id: Order.last)
     end 

    
end