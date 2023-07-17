class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /users or /users.json
  def index
    users = User.all
    render json: users, each_serializer: UsersSerializer 
  end

  # find user by id
  def show
    user = find_by_id
    if user.nil?
      error_message
    else
      render json: user
    end
  end

  # POST /users or /users.json
  def create
    user = User.new(user_params)

      if user.save
        render json: user, status: :created
      else
        error_message
      end
    end
  

  # PATCH/PUT /users/1 or /users/1.json
  def update
    user = find_by_id
  
    if user
      if user.update(user_params)
        render json: { message: "User successfully updated" }, status: :ok
      else
        render json: user.errors, status: :unprocessable_entity
      end
    else
      error_message
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    user = find_by_id

    if user
      user.destroy
      render json: { message: "User sucessfully removed"}
    else
      error_message
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_by_id
      User.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :age, :height, :email, :username, :password)
    end

    def error_message
      render json: { error: "Record not found"}, status: :not_found
    end
end
