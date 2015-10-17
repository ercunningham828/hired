class JobsController < ApplicationController
  def index
    @jobs=Job.all
  end

  def show
    @job=Job.find(params[:id])
  end

  def new
    @job=Job.new
  end

  def create
    @job=Job.new(params.require(:job).permit(:title,:description))
    if @job.save
      flash[:notice]= "Job was successfully listed."
      redirect_to @job
    else
      flash[:error]= "There was an error in creating the job."
      render :new
    end
  end

  def edit
    @job=Job.find(params[:id])
  end

  def update
    @job=Job.find(params[:id])
    if @job.update_attributes(params.require(:job).permit(:title,:description))
      flash[:notice]= "Job was successfully listed."
      redirect_to @job
    else
      flash[:error]= "There was an error in updating the job."
      render :edit
    end
  end

  def destroy
    @job =Job.find(params[:id])
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
