class IngredientsController < ApplicationController
  # before_action :set_ingredient, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /ingredients or /ingredients.json
  def index
    ingredients = Ingredient.all, 
  end

  # POST /ingredients or /ingredients.json
  def create
    ingredient = Ingredient.new(ingredient_params)

      if ingredient.save
        render json: ingredient, status: :created
      else
        render json: { errors: ingredient.errors.full_messages }, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    ingredient = find_by_id

    if ingredient
      ingredient.destroy
      render json: { message: "Ingredient sucessfully removed"}
    else
      render json: { error: "Ingredient not found" }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.permit(:recipe_id, :calories, :fat, :carbs, :protein)
    end
end
