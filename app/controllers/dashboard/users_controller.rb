module Dashboard
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: %i[ show edit update destroy ]

    # GET /users or /users.json
    def index
      @users = User.accessible_by(current_ability)
    end

    # GET /users/1 or /users/1.json
    def show
      authorize! :read, @user
    end

    # GET /users/new
    def new
      @user = User.new
      @user.department = current_user.department unless current_user.super_admin?
      authorize! :new, @user
    end

    # GET /users/1/edit
    def edit
      authorize! :update, @user
    end

    # POST /dashboard/users or /dashboard/users.json
    def create
      @user = User.new(user_params)
      @user.department = current_user.department unless current_user.super_admin?
      authorize! :create, @user

      respond_to do |format|
        if @user.save
          format.html { redirect_to dashboard_user_url(@user), notice: "Usuario creado exitosamente." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /dashboard/users/1 or /dashboard/users/1.json
    def update
      authorize! :update, @user

      attrs = user_params
      attrs = attrs.except(:department) unless current_user.super_admin?

      respond_to do |format|
        if @user.update(attrs)
          format.html { redirect_to dashboard_user_url(@user), notice: "Usuario actualizado exitosamente." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /dashboard/users/1 or /dashboard/users/1.json
    def destroy
      authorize! :destroy, @user
      @user.destroy

      respond_to do |format|
        format.html { redirect_to dashboard_users_url, notice: "Usuario eliminado exitosamente." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.accessible_by(current_ability).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:email, :department, :password, :password_confirmation)
      end
  end
end