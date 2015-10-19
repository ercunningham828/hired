class ApplicationsController < ApplicationController
  def index
    @fresh=Application.fresh
    @review=Application.review
    @rejected=Application.rejected
    @hired=Application.hired

    authorize @fresh
  end

  def new
    @application=Application.new
    authorize @application
  end

  def create
    @job=Job.find(params[:job_id])
    @application=@job.applications.build(application_params)
    authorize @application

    if @application.save
      flash[:notice]= "Congratulations! You have successfully submitted an application."
      redirect_to @job
    else
      flash[:error]= "There was an error in submitting your application. Please try again."
      render 'jobs/show'
    end
  end

  def show
    @application=Application.find(params[:id])
    authorize @application
  end


  private

  def application_params
    params.require(:application).permit(:name,:phone,:email,:status,:resume,:coverletter)
  end
end
