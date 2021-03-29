class CookiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    if @oven.cookies.present?
      redirect_to @oven, alert: 'A batch of cookies is already in the oven!'
    else
      @cookie = @oven.cookies.new
    end
  end

  def create
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    # @cookie = @oven.create_cookie!(cookie_params)
    qty = cookie_params[:qty].to_i
    qty.times.each do
      @oven.cookies.create!(fillings: cookie_params[:fillings])
    end
    redirect_to oven_path(@oven)
  end

  private

  def cookie_params
    params.require(:cookie).permit(:fillings, :qty)
  end
end
