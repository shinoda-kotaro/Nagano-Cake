class Admins::GenresController < Admins::Base
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "Genre successfully created"
      redirect_to admins_genres_path
    else
      @genres = Genre.all
      flash[:error] = "Something went wrong"
      render 'index'
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
      if @genre.update(genre_params)
        flash[:success] = "Genre was successfully updated"
        redirect_to admins_genres_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  private
  
  def genre_params
    params.require(:genre).permit(:name, :is_effective)
  end
  
end
