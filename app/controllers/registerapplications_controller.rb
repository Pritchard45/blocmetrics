class RegisterapplicationsController < ApplicationController


  def index
    @registerapplications = current_user.registerapplications
  end

  def create
    @registerapplication = Registerapplication.new(registerapplication_params)
    @registerapplication.user = current_user

    if @registerapplication.save
      flash[:notice] = "You have registered your application successfully."
      redirect_to @registerapplication
    else
      flash.now[:alert] = "There was an error in registering your application. Please try again."
      render :new
    end
  end

  def show
    @registerapplication = current_user.registerapplications.find(params[:id])
    @events = @registerapplication.events.group_by(&:name)
  end

  def new
    @registerapplication = Registerapplication.new
  end

  def edit
    @registerapplication = current_user.registerapplications.find(params[:id])
  end

  def update
    @registerapplication = current_user.registerapplications.find(params[:id])
    @registerapplication.assign_attributes(registerapplication_params)

    if @registerapplication.save
      flash[:notice] = "You have updated your application successfully."
      redirect_to @registerapplication
    else
      flash.now[:alert] = "There was an error in updating your application. Please try again."
      render :edit
    end
  end


  def destroy
    @registerapplication = current_user.registerapplications.find(params[:id])

    if @registerapplication.destroy
      flash[:notice] = "\"#{@registerapplication.name}\" was deregistered successfully."
      redirect_to @registerapplication
    else
      flash.now[:alert] = "There was an error deleting the app. Try again?"
      render :show
    end
  end

  private
  def registerapplication_params
    params.require(:registerapplication).permit(:name, :url)
  end
end
