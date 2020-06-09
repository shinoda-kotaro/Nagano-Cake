class Admins::GenresController < Admins::Base
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(params[:id])
    if @genre.save
      flash[:success] = "Genre successfully created"
      redirect_to 
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def edit
  end

  def update
    @genre = Genre.find(params[:id])
      if @genre.update_attributes(params[:genre])
        flash[:success] = "Genre was successfully updated"
        redirect_to 
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  
end
