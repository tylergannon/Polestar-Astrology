module Admin
  class MembersController < ApplicationController
    before_filter :create!, only: [:create]
    before_filter :update!, only: [:update]
    load_and_authorize_resource
    respond_to :html
    
    def index
    end
    
    def create
    end
    
    def create!
      @member = Member.new
      @member.email = params[:member][:email]
      @member.password = params[:member][:password]
      @member.password_confirmation = params[:member][:password_confirmation]
      @member.save!

      respond_with @member do |format|
        format.html {
          redirect_to admin_members_path
        }
      end
    end
    
    def new
    end
    
    def show
    end
    
    def update
    end
    
    def update!
      @member = Member.find(params[:id])
      @member.update params.permit(:email, :password, :password_confirmation)
      respond_with @member do |format|
        format.html {
          if @member.valid?
            redirect_to admin_members_path
          else
            flash[:error] = "oh noes"
          end
        }
      end
    end
    
    def edit
    end
    
    def destroy
    end
  end
end
