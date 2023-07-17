class AdminsController < ApplicationController
  # before_action :set_admin, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /admins or /admins.json
  def index
    admins = Admin.all
    render json: admins, each_serializer: AdminsSerializer
  end

  # POST /admins or /admins.json
  def create
    admin = Admin.new(admin_params)

      if admin.save
        render json: admin, status: :created
      else
        render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /admins/1 or /admins/1.json
  def update
    admin = find_by_id
  
    if admin
      if admin.update(admin_params)
        render json: { message: "Admin successfully updated" }, status: :ok
      else
        render json: admin.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Admin not found" }, status: :not_found
    end
  end
  

  # DELETE /admins/1 or /admins/1.json
  def destroy
    admin = find_by_id

    if admin
      admin.destroy
      render json: { message: "Admin sucessfully removed"}
    else
      render json: { error: "Admin not found" }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_by_id
      Admin.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.permit(:name, :username, :email, :password)
    end
end
