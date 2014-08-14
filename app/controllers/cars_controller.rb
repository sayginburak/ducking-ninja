class CarsController < ApplicationController
  def index
  	@cars=Car.all
  end

  def show
  	@car=Car.find(params[:id])
  end

  def edit
  	@car=Car.find(params[:id])
  end

  def update
  	@car=Car.find(params[:id])
  	@car.update_attributes(car_params)
  	flash[:notice]="Record succesfully updated"
  	redirect_to(:action=>"show",:id=>@car.id)

  end

  def new
  	@car=Car.new
  end

  def create
  	@car=Car.new(car_params)
  	if @car.save
  		flash[:notice]="#{@car.make} #{@car.model} added"
  		redirect_to @car
  		
  	else
  		flash[:notice]="Something went wrong"
  		render :new

  	end
  end

  def delete
  	@car=Car.find(params[:id])
  end

  def destroy
  	@car=Car.find(params[:id])
  	@car.destroy
  end
  private
  def car_params
  	params.require(:car).permit!
  end

end
