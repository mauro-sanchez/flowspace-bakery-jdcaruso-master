class OvensController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @ovens = current_user.ovens
  end

  def show
    @oven = current_user.ovens.find_by!(id: params[:id])
  end

  def empty
    @oven = current_user.ovens.find_by!(id: params[:id])
    if @oven.cookies.present?
      @oven.cookies.update(storage: current_user)
    end
    redirect_to @oven, alert: 'Oven emptied!'
  end
end
