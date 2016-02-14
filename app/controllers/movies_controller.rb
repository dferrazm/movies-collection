class MoviesController < AuthenticatedController
  def new
    @movie = Movie.new
  end

  def create
    @movie = user_collection.add(movie_params)

    if @movie.persisted?
      redirect_to root_path, notice: I18n.t('movies.added_successfully') 
    else
      render :new
    end
  end

  # def destroy
  #   @movie.destroy
  #   redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  # end

  private

  def movie_params
    params
      .require(:movie)
      .permit(:name, :genre, :year, :director, :description)
      .merge(user: current_user)
  end

  def user_collection
    @user_collection ||= Users::MoviesCollection.new(current_user)
  end
end
