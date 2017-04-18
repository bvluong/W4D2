class CatRentalRequestsController < ApplicationController

  def new

  end

  def create
    @new_cat_rental = CatRentalRequest.new(rental_request_params)

    if @new_cat_rental.save
      redirect_to cats_url(@new_cat_rental.cat_id)
    else
      render :new
    end
  end

  private

  def rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
