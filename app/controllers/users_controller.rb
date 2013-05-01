class UsersController < ApplicationController

  skip_before_filter :login_required, :only => [ :show ]

  def show
    @user = User.find params[:id]
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      @current_user = nil
      flash[:notice] = "Goodbye my love goodbye, goodbye auf wiedersehen!"
      redirect_to :controller => 'home', :action => "index"
    end
  end


  def update
    if @current_user.update_attributes(params[:user])
      flash[:notice] = 'User profile was successfully updated.'
      redirect_to :action => "show"
    else
      render :action => "edit"
    end
  end

end
