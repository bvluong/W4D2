class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def new
    @COLORS = Cat.colors
    @cat = Cat.new
  end

  def show
    @cat = find_cat
  end

  def create
    @new_cat = Cat.new(cat_params)

    if @new_cat.save
      redirect_to cats_url(@new_cat)
    else
      render :new
    end
  end

  def edit
    @cat = find_cat
    @COLORS = Cat.colors
  end

  def update
    @cat = find_cat
    if @cat.update_attributes(cat_params)
      redirect_to cats_url(@cat)
    else
      redirect_to :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end

  def find_cat
    Cat.find(params[:id])
  end
end
