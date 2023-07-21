class RecipesController < ApplicationController
  # before_action :set_recipe, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /recipes & ingredients
  def index
    recipes = Recipe.all
    render json: recipes, each_serializer: RecipeSerializer
  end

  # Get all recipes
  def summary
    recipes =Recipe.all
    render json: recipes
  end

  # POST /admins or /admins.json
  def create
    recipe = Recipe.new(recipe_params)

      if recipe.save
        render json: recipe, status: :created
      else
        render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
      end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    recipe = find_by_id

    if recipe
      recipe.destroy
      render json: { message: "Recipe sucessfully removed"}
    else
      render json: { error: "Recipe not found" }, status: :not_found
    end
  end

  private
    def find_by_id
      Recipe.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.permit(:user_id, :recipe, :image_url, :ingredient_id)
    end
end
