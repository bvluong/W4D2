class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
  end

  def create
    @new_cat_rental = CatRentalRequest.new(rental_request_params)

    if @new_cat_rental.save
      redirect_to cat_url(@new_cat_rental.cat_id)
    else
      redirect_to new_cat_rental_request_url
    end
  end

  def approve
    @cat_rental = find_rental
    @cat_rental.approve!
    redirect_to cats_url
  end

  def deny
    @cat_rental = find_rental
    @cat_rental.deny!
    redirect_to cats_url
  end

  private

  def rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end

  def find_rental
    CatRentalRequest.find(params[:id])
  end
end
