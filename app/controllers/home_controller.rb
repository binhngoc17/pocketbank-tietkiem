class HomeController < ApplicationController
  def index
    @qc = Credit.search(params[:q])
    @qd = Debit.search(params[:q])
  end

  def about

  end
end
