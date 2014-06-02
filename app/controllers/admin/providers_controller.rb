class Admin::ProvidersController < ::AdminController
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to admin_providers_path, :notice => "Provider was successfully created."
    else
      render :action => :new
    end
  end

  def index
    respond_to do |format|
      format.html { }
      format.json do 
        if params[:query] and !params[:query].blank?
          @providers = Provider.order(:name).query(params[:query]).paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        else
          @providers = Provider.order(:name).paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        end
      end
    end
  end

  def edit
    @provider = Provider.find(params[:id])
    render :action => :new
  end

  def update
    @provider = Provider.find(params[:id])
    up = provider_params
    up.delete(:password_confirmation) if provider_params[:password].blank?
    up.delete(:password) if provider_params[:password].blank?

    if @provider.update_attributes(up)
      redirect_to admin_providers_path, :notice => "Provider was successfully updated."
    else
      render :action => :new
    end
  end
  
  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
  end

  private
  def provider_params
    params.require(:provider).permit(:name, :image, :link)
  end
end
