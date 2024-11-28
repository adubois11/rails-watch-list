class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: "Liste créée avec succès"
    else
      render :new, status: :unprocessable_entity

    end
  end

  private

  # Méthode privée pour sécuriser les paramètres
  def list_params
    params.require(:list).permit(:name)
  end
end