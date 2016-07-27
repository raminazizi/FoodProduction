class PurchasingsController < ApplicationController
  before_action :set_purchasing, only: [:show, :edit, :update, :destroy]

  # GET /purchasings
  # GET /purchasings.json
  def index
    @purchasings = Purchasing.all
  end

  # GET /purchasings/1
  # GET /purchasings/1.json
  def show
  end

  # GET /purchasings/new
  def new
    @purchasing = Purchasing.new
  end

  # GET /purchasings/1/edit
  def edit
  end

  # POST /purchasings
  # POST /purchasings.json
  def create
    @purchasing = Purchasing.new(purchasing_params)

    respond_to do |format|
      if @purchasing.save
        format.html { redirect_to @purchasing, notice: 'Purchasing was successfully created.' }
        format.json { render :show, status: :created, location: @purchasing }
      else
        format.html { render :new }
        format.json { render json: @purchasing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchasings/1
  # PATCH/PUT /purchasings/1.json
  def update
    respond_to do |format|
      if @purchasing.update(purchasing_params)
        format.html { redirect_to @purchasing, notice: 'Purchasing was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchasing }
      else
        format.html { render :edit }
        format.json { render json: @purchasing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchasings/1
  # DELETE /purchasings/1.json
  def destroy
    @purchasing.destroy
    respond_to do |format|
      format.html { redirect_to purchasings_url, notice: 'Purchasing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchasing
      @purchasing = Purchasing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchasing_params
      params.require(:purchasing).permit(:date)
    end
end
