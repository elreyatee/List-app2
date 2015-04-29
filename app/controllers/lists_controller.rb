class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id: params[:id])
    @item = Item.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:notice] = 'Your list has been created'
      redirect_to root_path
    else
      flash[:error] = 'There was problem, try again'
      render 'new'
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])

    if @list.update(list_params)
      flash[:notice] = 'Your list has been updated'
      redirect_to list_path(@list)
    else
      flash[:error] = 'There was a problem'
      render 'edit'
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, items_attributes: [:id, :_destroy])
  end
end
