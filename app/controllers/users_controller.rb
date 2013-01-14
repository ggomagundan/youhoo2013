class UsersController < ApplicationController


  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  
  def show
    @user = User.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
	sign_in @user
        flash[:success] = "Welcome to the Sample app"
	redirect_to @user
    end
  end

  def edit
  end

  def update
    @user = Userf.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] ="Profile updated"
      redirect_to @user 	
    else
      render 'edit' 
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end


end
