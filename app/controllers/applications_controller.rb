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
    @job=Job.friendly.find(params[:job_id])
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
    @application=Application.friendly.find(params[:id])
    @job=@application.job
    authorize @application
  end

  def update
    @application=Application.friendly.find(params[:id])
    @job=Job.friendly.find(params[:job_id])
    authorize @application

    if @application.update_attributes(application_params)
      flash[:notice]= "Application was successfully updated."
      redirect_to [@job,@application]
    else
      flash[:error]= "There was an error in updating the application."
      render :show
    end
  end

  private

  def application_params
    params.require(:application).permit(:name,:phone,:email,:status,:resume,:coverletter,:notes)
  end
end
