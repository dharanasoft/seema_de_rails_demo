class AddressesController < ApplicationController
  in_place_edit_for :address, :name
  
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

  def set_address_name
    name = params[:value]
    address = Address.find(params[:id])
    prev_name = address.name
    if address.update_attributes(:name => name)
      render :json => name
    else
      render :json => prev_name
    end
  end
  
  def set_address_phone
    phone = params[:value]
    address = Address.find(params[:id])
    prev_phone = address.phone
    if address.update_attributes(:phone => phone)
      render :json => phone, :layout => false
    else
      render :json =>prev_phone 
    end
  end
  
  def set_address_email
    email = params[:value]
    address = Address.find(params[:id])
    prev_email = address.email
    if address.update_attributes(:email => email)
      render :json => email, :layout => false
    else 
      render :json => prev_email
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_url, :notice => "Successfully destroyed address."
  end

  
end
