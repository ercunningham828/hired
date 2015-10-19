class JobsController < ApplicationController
  def index
    @jobs=Job.all
  end

  def show
    @job=Job.friendly.find(params[:id])
    @application=Application.new
    @errors=@application.errors
  end

  def new
    @job=Job.new
    authorize @job
  end

  def create
    @job=Job.new(params.require(:job).permit(:title,:description))
    authorize @job

    if @job.save
      flash[:notice]= "Job was successfully listed."
      redirect_to @job
    else
      flash[:error]= "There was an error in creating the job."
      render :new
    end
  end

  def edit
    @job=Job.friendly.find(params[:id])

    authorize @job
  end

  def update
    @job=Job.friendly.find(params[:id])
    authorize @job

    if @job.update_attributes(params.require(:job).permit(:title,:description))
      flash[:notice]= "Job was successfully listed."
      redirect_to @job
    else
      flash[:error]= "There was an error in updating the job."
      render :edit
    end
  end

  def destroy
    @job =Job.friendly.find(params[:id])
    authorize @job

     title = @job.title
 
     if @job.destroy
       flash[:notice] = "The listing for \"#{title}\" was deleted successfully."
       redirect_to jobs_path
     else
       flash[:error] = "There was an error deleting the listing."
       render :show
     end
  end
end
