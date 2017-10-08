class ShoutsController < ApplicationController
  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirect_options_for(shout)
  end

  def show
    @shout = Shout.find(params[:id])
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: "Shout was created!" }
    else
      { alert: "There is a problem creating your shout." }
    end
  end
end
