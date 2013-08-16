class AccountController < ApplicationController
  
  skip_before_filter :login_required

  protect_from_forgery :except => :callback

  def login
  end

  def logout
    clear_login
  end
  
  def callback
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    email = auth_hash[:info][:email]

    user = User.find_by_uid uid

    if user.nil?
      user = User.new(:uid => uid)
    end

    user.name = name unless name.blank?
    user.email = email unless email.blank?

    user.save!

    session[:user_id] = user.id

    dude = name.split(' ')[0]
    greetings = Array.new
    greetings << "Sup, G, hows your moma?" << "What up, cheese doodle?" << "Hey #{dude}, whats poppin?"
    greetings << "#{dude}! Supdawg!" << "Whats doin #{dude}?" << "Yo #{dude}, what's craicalackin?"
    flash[:success] = greetings.sample
    
    redirect_to :controller => 'home', :action => 'index'
  end

  private

  def auth_hash
    puts "AUTH HASH"
    request.env['omniauth.auth']
  end
  
  def clear_login
    session[:user_id] = nil
    @current_user = nil
  end

  def user_params
    params.require(:user).permit(:name, :email, :uid)
  end
 
end
