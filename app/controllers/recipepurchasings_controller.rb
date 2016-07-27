class RecipepurchasingsController < ApplicationController
  before_action :set_recipepurchasing, only: [:show, :edit, :update, :destroy]
  before_action :set_purchasing
  # GET /recipepurchasings
  # GET /recipepurchasings.json
  def index
    @recipepurchasings = Recipepurchasing.all
  end

  # GET /recipepurchasings/1
  # GET /recipepurchasings/1.json
  def show
  end

  # GET /recipepurchasings/new
  def new
    @recipes = Recipe.all.order(:name)
    @recipepurchasing = @purchasing.recipepurchasing.new
  end

  # GET /recipepurchasings/1/edit
  def edit
  end

  # POST /recipepurchasings
  # POST /recipepurchasings.json
  def create
    @recipepurchasing = Purchasing.recipepurchasing.new(recipepurchasing_params)

    respond_to do |format|
      if @recipepurchasing.save
        format.html { redirect_to @recipepurchasing, notice: 'Recipepurchasing was successfully created.' }
        format.json { render :show, status: :created, location: @recipepurchasing }
      else
        format.html { render :new }
        format.json { render json: @recipepurchasing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipepurchasings/1
  # PATCH/PUT /recipepurchasings/1.json
  def update
    respond_to do |format|
      if @recipepurchasing.update(recipepurchasing_params)
        format.html { redirect_to @recipepurchasing, notice: 'Recipepurchasing was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipepurchasing }
      else
        format.html { render :edit }
        format.json { render json: @recipepurchasing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipepurchasings/1
  # DELETE /recipepurchasings/1.json
  def destroy
    @recipepurchasing.destroy
    respond_to do |format|
      format.html { redirect_to recipepurchasings_url, notice: 'Recipepurchasing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipepurchasing
      @recipepurchasing = Recipepurchasing.find(params[:id])
    end
    def set_purchasing
      @purchasing = Purchasing.find(params[:purchasing_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def recipepurchasing_params
      params.require(:recipepurchasing).permit(:recipe_id_id, :purchasing_id_id, :production)
    end
end
