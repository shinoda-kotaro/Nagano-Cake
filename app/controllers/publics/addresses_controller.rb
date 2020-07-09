class Publics::AddressesController < Publics::Base
  def index
    @user = EndUser.find(current_end_user.id)
    @address = Address.new
    @addresses = @user.addresses.all
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      flash[:success] = "Object successfully created"
      redirect_to addresses_path
    else
      flash[:error] = "Something went wrong"
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
      if @address.update(address_params)
        flash[:success] = "Object was successfully updated"
        redirect_to addresses_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to addresses_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to addresses_path
    end
  end
  
  
  private

  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end
