class RecipeitemsController < ApplicationController
  before_action :set_recipeitem, only: [:show, :edit, :update, :destroy]
  before_action :set_recipe
    def index
      @recipeitems = Recipeitem.all
    end
    def show
    end
    def new
      @items = Item.all.order(:name)
      @recipeitem = @recipe.recipeitems.new
    end
    def edit
    end
    def create
      @recipeitem = @recipe.recipeitems.new(recipeitem_params)

      respond_to do |format|
        if @recipeitem.save
          format.html { redirect_to recipe_path(@recipe), notice: 'Recipe item was successfully created.' }
          format.json { render :show, status: :created, location: @recipeitem }
        else
          format.html { render :new }
          format.json { render json: @recipeitem.errors, status: :unprocessable_entity }
        end
      end
    end
    def update
      respond_to do |format|
        if @recipeitem.update(recipeitem_params)
          format.html { redirect_to recipe_path(@recipe), notice: 'Recipe item was successfully updated.' }
          format.json { render :show, status: :ok, location: @recipeitem }
        else
          format.html { render :edit }
          format.json { render json: @recipeitem.errors, status: :unprocessable_entity }
        end
      end
    end
    def destroy
      @recipeitem.destroy
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    private
      def set_recipeitem
        @recipeitem = Recipeitem.find(params[:id])
      end
      def set_recipe
        @recipe= Recipe.find(params[:recipe_id])
      end
      def recipeitem_params
        params.require(:recipeitem).permit(:item_id, :amount, :unit, :recipe_id)
      end
end
