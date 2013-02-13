class FeedbacksController < ApplicationController
  # GET /feedbacks
  # GET /feedbacks.xml
  def index
    @feedbacks = Feedback.all
    respond_with(@feedbacks)
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.xml
  def show
    @feedback = Feedback.find(params[:id])
    respond_with(@feedback)
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.xml
  def new
    @feedback = Feedback.new
    respond_with(@feedback)
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])
  end

  def create
    @feedback = Feedback.new feedback_params
    @feedback.member = current_member
    @feedback.save

    if @feedback.valid?
      FeedbackMailer.submitted(@feedback).deliver
    end
    
    respond_with(@feedback) do |format|
      format.html {
        if @feedback.valid?
          redirect_to root_url
        end
      }
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.xml
  def update
    @feedback = Feedback.find(params[:id])
    flash[:notice] = 'Feedback was successfully updated.' if @feedback.update feedback_params
    respond_with(@feedback)
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.xml
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    respond_with(@feedback)
  end
  
  def feedback_params
    params[:feedback].permit :subject, :feedback
    # params.require(:subject, :feedback)   #  .permit(:name, :age)
  end
end
