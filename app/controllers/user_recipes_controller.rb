class UserRecipesController < ApplicationController
  before_action :set_user_recipe, only: %i[ show edit update destroy ]

  # GET /user_recipes or /user_recipes.json
  def index
    user_recipes = UserRecipe.all
    render json: user_recipes, each_serializer: UserRecipeSerializer
  end

  # GET /user_recipes/1 or /user_recipes/1.json
  def show
  end

  # GET /user_recipes/new
  def new
    @user_recipe = UserRecipe.new
  end

  # GET /user_recipes/1/edit
  def edit
  end

  # POST /user_recipes or /user_recipes.json
  def create
    @user_recipe = UserRecipe.new(user_recipe_params)

    respond_to do |format|
      if @user_recipe.save
        format.html { redirect_to user_recipe_url(@user_recipe), notice: "User recipe was successfully created." }
        format.json { render :show, status: :created, location: @user_recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_recipes/1 or /user_recipes/1.json
  def update
    respond_to do |format|
      if @user_recipe.update(user_recipe_params)
        format.html { redirect_to user_recipe_url(@user_recipe), notice: "User recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @user_recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_recipes/1 or /user_recipes/1.json
  def destroy
    @user_recipe.destroy

    respond_to do |format|
      format.html { redirect_to user_recipes_url, notice: "User recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_recipe
      @user_recipe = UserRecipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_recipe_params
      params.fetch(:user_recipe, {})
    end
end
