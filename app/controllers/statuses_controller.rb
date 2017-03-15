class StatusesController < ApplicationController
  def create
    @status = current_user.statuses.build status_params
    if @status.save
      flash[:success] = "Status has been created"
    else
      flash[:danger] = "An errors has been occured, please try again later"
    end
  end

  def destroy
    @status = current_user.statuses.find params[:id]
    if @status.destroy
      flash[:success] = "Status has been deleted"
    else
      flash[:danger] = "An errors has been occured, please try again later"
    end
  end

  private
  def status_params
    params.require(:status).permit Status::STATUS_PARAMS
  end
end
