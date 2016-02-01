class ThingsController < ApplicationController

  def index
    @things = Thing.all
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(thing_params)
    if @thing.save
      redirect_to things_path
    else
      render :new
    end
  end

  def show
    @thing = Thing.find(params[:id])
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.update_attributes(thing_params)
      redirect_to thing_url(@thing.id)
    else
      render :edit
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    @thing = Thing.destroy
  end

  private
  def thing_params
    params.require(:thing).permit(:title, :description, :url)
  end

end
