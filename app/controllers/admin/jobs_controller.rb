class Admin::JobsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
	before_action :required_admin

	def index
    	@jobs = Job.all
    end
    
    def edit
    	@job = Job.find(params[:id])
    end

    def show
    	@job = Job.find(params[:id])
    end

	def new
      @job = Job.new
	end

	def create
	  @job = Job.new(job_params)
	  if @job.save
	  	redirect_to admin_jobs_path
	  else
	  	render :new
	  end
	end

	def update
		@job = job.find(params[:id])
		if @job.update(job_params)
			redirect_to admin_jobs_path
		else
			render :edit
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to admin_jobs_path
		flash[:warning] = "是否删除?"
	end



	private

	def job_params
		params.require(:job).permit(:title, :description)
	end
end
