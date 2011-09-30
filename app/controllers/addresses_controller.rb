class AddressesController < ApplicationController
  in_place_edit_with_validation_for :address, :name
  in_place_edit_with_validation_for :address, :phone
  in_place_edit_with_validation_for :address, :email
  
  def index
    if params[:search]
      @addresses = Address.where("name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(5)
    else
      @addresses = Address.order("name").page(params[:page]).per(5)
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])
    if @address.save
      redirect_to @address, :notice => "Successfully created address."
    else
      render :action => 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(params[:address])
      redirect_to @address, :notice  => "Successfully updated address."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_url, :notice => "Successfully destroyed address."
  end

  
end
