class JobsController < ApplicationController
  def index
    if params[:location]
      @jobs    = Job.where(city: params[:location])
    elsif params[:sort]
      @jobs    = Job.order(:city)
    elsif params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs    = @company.jobs
    else
      @jobs    = Job.all
    end
  end

  def new
    @company    = Company.find(params[:company_id])
    @categories = Category.all
    @job        = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job            = Job.find(params[:id])
    @comments       = @job.comments.all
    @comment        = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job        = Job.find(params[:id])
    @company    = @job.company
    @categories = Category.all
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    redirect_to company_job_path(@job.company, @job)
  end

  def destroy
    @job = Job.find(params[:id])    
    @job.destroy

    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
