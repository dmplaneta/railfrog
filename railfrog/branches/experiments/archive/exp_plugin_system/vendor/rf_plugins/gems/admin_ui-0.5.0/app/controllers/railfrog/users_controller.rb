class Railfrog::UsersController < Railfrog::BaseController
  require 'digest/sha1'
  
  # Login Authentication
  def authenticate
    encrypted_password = SHA1.hexdigest params[:password]
    user = User.find_by_email_and_password params[:email], encrypted_password
    if user
      session[:user_id] = user.id
      # ToDo: Store user details in a hash in the session state
      session[:first_name] = user.first_name
      session[:last_name] = user.last_name
      redirect_to rf_admin_url
    else
      flash[:error] = 'Log In Failed'
      redirect_to :action => 'login'
      return
    end
  end
  
  def login
    render :layout => 'login'
  end
  
  # Logout
  # TODO: Return URI
  def logout
    session[:user_id] = nil
    session[:first_name] = nil
    session[:last_name] = nil
    flash[:notice] = 'Logout Sucessful'
    redirect_to :action => 'login'
  end
  
  # User Administration
  def index
    list
    render :action => 'list'
  end

  def list
    @user_pages, @users = paginate :users, :per_page => 10
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User Successfully Created'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
end