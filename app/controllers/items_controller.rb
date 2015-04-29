class ItemsController < ApplicationController

  def create
    @list = List.find_by(id: params[:list_id])
    @item = @list.items.build(item_params)
    @item.creator = current_user

    if @item.save
      flash[:notice] = "Your #{@item.name} has been added to the list"
      redirect_to list_path(@list)
    else
      flash[:error] = 'There was a problem, please try again'
      render 'lists/show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :quantity)
  end
end
