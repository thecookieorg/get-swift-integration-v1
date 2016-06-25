class SwiftApiKeysController < ApplicationController
  before_action :set_swift_api_key, only: [:show, :edit, :update, :destroy]

  # GET /swift_api_keys
  # GET /swift_api_keys.json
  def index
    @swift_api_keys = SwiftApiKey.all
  end

  # GET /swift_api_keys/1
  # GET /swift_api_keys/1.json
  def show
  end

  # GET /swift_api_keys/new
  def new
    @swift_api_key = SwiftApiKey.new
  end

  # GET /swift_api_keys/1/edit
  def edit
  end

  # POST /swift_api_keys
  # POST /swift_api_keys.json
  def create
    @swift_api_key = SwiftApiKey.new(swift_api_key_params)

    respond_to do |format|
      if @swift_api_key.save
        format.html { redirect_to @swift_api_key, notice: 'Swift api key was successfully created.' }
        format.json { render :show, status: :created, location: @swift_api_key }
      else
        format.html { render :new }
        format.json { render json: @swift_api_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swift_api_keys/1
  # PATCH/PUT /swift_api_keys/1.json
  def update
    respond_to do |format|
      if @swift_api_key.update(swift_api_key_params)
        format.html { redirect_to @swift_api_key, notice: 'Swift api key was successfully updated.' }
        format.json { render :show, status: :ok, location: @swift_api_key }
      else
        format.html { render :edit }
        format.json { render json: @swift_api_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swift_api_keys/1
  # DELETE /swift_api_keys/1.json
  def destroy
    @swift_api_key.destroy
    respond_to do |format|
      format.html { redirect_to swift_api_keys_url, notice: 'Swift api key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swift_api_key
      @swift_api_key = SwiftApiKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swift_api_key_params
      params.require(:swift_api_key).permit(:key)
    end
end
