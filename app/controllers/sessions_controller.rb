class SessionsController < ApplicationController
  def new
  end

  #nam@gmail.com -- namdaica_123
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def create_provider
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    user = User.find_by(email: auth_hash["info"]["email"])
    if @authorization.nil?
      user = new_provider_user(auth_hash) if user.nil? 
      user.authorizations.build(:provider => auth_hash["provider"], :uid => auth_hash["uid"])
      user.save
    end
    provider_login user
  end
end
