class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = find_cat
  end

  private

  def find_cat
    Cat.find(params[:id])
  end
end
