class ChangePasswordsController < ApplicationController
  before_filter :authenticate_member!

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    # raise params.inspect
    if @member.update_with_password password_params
      sign_in(@member, :bypass => true)
      redirect_to root_path, :notice => "Your Password has been updated!"
    else
      # redirect_to change_password_path
      flash[:error] = ''
      
      @member.errors.each do |error, message|
        flash[:error] += "#{error.to_s.titleize} #{message}"
      end
      render :edit,:locals => { :resource => @member, :resource_name => "member" }
    end
  end
  
  def password_params
    params[:member].permit :email, :reset_password_token, :current_password, :password, :password_confirmation
  end
end