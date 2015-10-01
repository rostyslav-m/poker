class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new    
    @user = User.new
#    @user = User.where(email: :email).first_or_create
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
   @user = User.new(user_params)

#   @user = User.where(email: user_params[:email]).update_or_create(email: user_params[:email])

#    @user = User.where(email: user_params[:email])
#    @user.update(@user, user_params)
#    unless @user
#      @user = User.new(user_params)
#    end 

#    @user.update( :table_ids => @user[:table_ids])

#    @user = User.where(email: user_params[:email]).first_or_create

#    @user = User.find_or_create_by(:email => user_params[:email])

#    @user = User.where(:email => params[:email]).first_or_create
 
#    @user = User.where(:email => params[:user][:email]).first_or_create do |user|
      # This block is called with a new user object with only :email set
      # Customize this object to your will
#      user.attributes = params[:user]
      # After this, first_or_create will call user.create, so you don't have to
#    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, {:table_ids => []}, table_attributes: [ :id, :tabname, :time])
    end
end
