class MoviesController < AuthenticatedController
  include MoviesHandling

  def recents
    render :movies, locals: { movies: movies_collection.recents }
  end

  def create
    movie = movies_collection.add(movie_params)

    if movie.persisted?
      redirect_to edit_movie_path(movie)
    else
      redirect_to root_path, alert: I18n.t('movies_collection.movie_not_added')
    end
  end

  def edit
    render_edit(target_movie)
  end

  def update
    if target_movie.update_attributes(movie_params)
      redirect_to root_path
    else
      render_edit(target_movie)
    end
  end

  def destroy
    target_movie.destroy
    render nothing: true
  end

  private

  def movie_params
    params
      .require(:movie)
      .permit(:name, :genre, :year, :director, :description)
  end

  def render_edit(movie)
    render :edit, locals: { movie: movie }
  end
end
