require 'httparty'
require 'json'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    #api_key = "cb8d3966-e1c6-4429-a8cf-b615523481c4"

    @item = Item.new(item_params)

    @swift_api_key = SwiftApiKey.first

    api_key = @swift_api_key.key

    HTTParty.post("https://app.getswift.co/api/v2/deliveries",
          {
            :body => {
                        "apiKey": api_key,
                        "booking":{
                            "items": [{
                                "quantity": @item.quantity,
                                "sku": @item.sku,
                                "description": @item.description,
                                "price": @item.price
                            }],
                            "pickupDetail": {
                                "name": "Marko",
                                "phone": "604 356 8259",
                                "address": "301 Maude Road, Port Moody, V3H5B1"
                            },
                            "dropoffDetail": {
                                "name": @item.name,
                                "phone": @item.phone,
                                "address": @item.address
                            }
                        }
                    }.to_json,
            :headers => { 'Content-Type' => 'application/json' }
          }
      )

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :phone, :address, :quantity, :description, :price, :sku)
    end
end
