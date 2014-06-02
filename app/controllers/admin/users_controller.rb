class Admin::UsersController < ::AdminController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, :notice => "User was successfully created."
    else
      render :action => :new
    end
  end

  def index
    respond_to do |format|
      format.html { }
      format.json do 
        if params[:query] and !params[:query].blank?
          @users = User.query(params[:query]).paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        else
          @users = User.paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        end
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    render :action => :new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def update
    @user = User.find(params[:id])
    up = user_params
    up.delete(:password_confirmation) if user_params[:password].blank?
    up.delete(:password) if user_params[:password].blank?

    if @user.update_attributes(up)
      redirect_to admin_users_path, :notice => "User was successfully updated."
    else
      render :action => :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :role, :password, :password_confirmation, :avatar, :phone, :province_id) 
  end
end
