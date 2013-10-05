class WeeksController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_filter :admin_user, only: :destroy

  def new
    @week = Week.new
  end

  def show
    @week = Week.find(params[:id])
  end
  
  def index
    @weeks = Week.paginate(page: params[:page])
  end
  
  def create
    @week = Week.new(params[:week])
    @users = User.all
    #@week.users << @users    
    if @week.save
        flash[:success] = "Congratulations, a new week has been created!"
        @week.users << @users    
        redirect_to @week 
    else
	render 'new'
    end  
  end

  def destroy
    Week.find(params[:id]).destroy
    flash[:success] = "Week destroyed."
    redirect_to weeks_url
  end

  def edit
       @week = Week.find(params[:id])
  end

  def update
    @week = Week.find(params[:id])
    if @week.update_attributes(params[:week])
      flash[:success] = "Week updated"
      redirect_to @week
    else
      render 'edit'
    end
  end

  private



    def admin_user
      redirect_to(root_path) unless current_week.admin?
    end

end
