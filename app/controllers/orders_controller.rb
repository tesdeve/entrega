class OrdersController < ApplicationController

  # the two line below works great for company, can create a transporter and all is gooood!!! 
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user



  #before_action :set_transporter  # set fot testing from transporter
  #before_action :set_transporters
  # GET /orders
  # GET /orders.json

 def index  
   @orders = @user.orders # Original
 end

  def transporter_orders    
    @transporter = @user.transporter.find(params[:id])
    @orders = @transporter.orders
  end
#
  def posts
    coordinates =[@user.latitude, @user.longitude]
    @orders = Order.posted.select {|o| (Geocoder::Calculations.distance_between(coordinates, \
                [o.pu_lat,o.pu_lng])*1000) <= o.radius ? o : nil}
    render :index
  end


  def posted
    #@user = @sender
    @orders = @user.orders.posted
  end


  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order= @user.orders.build
   # @order = Order.new({:sender_id => @sender})
  # @sender = Sender.find(params[:sender_id])
  #  @order = @sender.orders.create(order_params)#{:sender_id => @sender.id}) #.id removed when try to work with sender to create a new order
  #  puts "HIIIuuuIII"
  #  puts params
  end

  # GET /orders/1/edit
  def edit
  #  if @user = @sender
  #    render :sender_order
  #  elsif @user = @company
  #    render :company_order
  #  end
  end

  # POST /orders
  # POST /orders.json
  def create
    #@sender = Sender.find(params[:sender_id])
    #@order = @sender.orders.create(order_params)  #{:sender_id => @sender.id}) #.id removed when try to work with sender to create a new order
   
# the three lines of code below help with setting the posted value. It can be used for the button for posting the order
   @order= @user.orders.build(order_params) 
  # if @order.status == "draft"
  #   seton_draft
  # else
  #   seton_create
  # end
  # @order.save
# Up to here for the button to Post
   puts 'PARAMS'
   puts params
    respond_to do |format|
      if @order.save
        puts 'PARAMS CREATED'
        format.html { redirect_to url_for([@user, @order]), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

#  def draft 
#    #set_user
#
#    @order= @user.orders.build(order_params) 
#    seton_draft
#    @order.save 
#     respond_to do |format|
#      if @order.save
#        puts 'PARAMS CREATED'
#        format.html { redirect_to url_for([@user, @order]), notice: 'Order was successfully created.' }
#        format.json { render :show, status: :created, location: @order }
#      else
#        format.html { render :new }
#        format.json { render json: @order.errors, status: :unprocessable_entity }
#      end
#    end 
#  end
#
   # puts "HIIIuuuIII"
   # puts params
   # puts "HIIIIIIII"
    #@order = Sender.orders.create(order_params)
    #@order = Order.new(order_params)



  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to url_for([@user, @order]), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to url_for([@user, :orders]), notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_user
      resource, id = request.path.split('/')[1,2]
      @user = resource.singularize.classify.constantize.find(id)
    end

   def order_params
     params.require(:order).permit(:description, :weight, :length, :width, :heigth, :pickup_address, :pu_lat, :pu_lng, :pu_time, :delivery_address, :dy_lat, :dy_lng, :dy_time, :cost, :status, :radius, :sender_id, :transporter_id)
   end
end




# Below is the coded added
#  Needs a code for when working from the Transporter
   #def set_transporter
   #  @user =@company
   #  #@company = Company.find(params[:id])
   #  @transporter = @company.transporters.find(params[transporter_id])
   #end

   #def set_transporters

   #  @transporters = @company.transporter.all
   #end

  #  def seton_create
  #    @order.status = 1
  #  end
#
  #  def seton_draft
  #    @order.status = 0
  #  end
#

   # def sender_sender
   #   @sender = Sender.find(params[:id])
   # end

    # Never trust parameters from the scary internet, only allow the white list through.
 
