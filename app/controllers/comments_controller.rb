class CommentsController < ApplicationController
    def create
        @comment        = Comment.new(comment_params)
        @comment.job_id = params[:job_id]
        
        if @comment.save
            flash[:success] = "Thank you for sharing a comment!"
            redirect_to company_job_path(@comment.job.company, @comment.job)
        else
            # byebug
            flash[:notice] = "Please enter a message before submmitting a comment"
            redirect_to company_job_path(@comment.job.company, @comment.job)
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end