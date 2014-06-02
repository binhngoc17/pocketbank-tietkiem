class Admin::CategoriesController < ::AdminController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, :notice => "Category was successfully created."
    else
      render :action => :new
    end
  end

  def index
    respond_to do |format|
      format.html { }
      format.json do 
        if params[:query] and !params[:query].blank?
          @categories = Category.query(params[:query]).paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        else
          @categories = Category.paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        end
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, :notice => "Category was successfully updated."
    else
      render :action => :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    render :action => :new
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private
  def category_params
    params.require(:category).permit(:name, :eng_name, :fr_name, :ger_name) 
  end
end
