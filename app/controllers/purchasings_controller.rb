class PurchasingsController < ApplicationController
  before_action :set_purchasing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @purchasings = current_user.purchasings
  end

  def show
  end

  def new
    @purchasing = Purchasing.new
  end

  def edit
  end

  def create
    @purchasing = Purchasing.new(purchasing_params)
    @purchasing.user_id = current_user.id
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

  def destroy
    @purchasing.destroy
    respond_to do |format|
      format.html { redirect_to purchasings_url, notice: 'Purchasing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_purchasing
      @purchasing = Purchasing.find(params[:id])
    end

    def purchasing_params
      params.require(:purchasing).permit(:date)
    end
end
