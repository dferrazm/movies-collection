class MoviesController < AuthenticatedController
  def create
    movie = movies_collection.add(movie_params)

    if movie.persisted?
      redirect_to edit_movie_path(movie)
    else
      redirect_to root_path, notice: I18n.t('movies_collection.movie_not_added')
    end
  end

  def edit
    render_edit(target_movie)
  end

  def update
    if target_movie.update_attributes(movie_params)
      redirect_to root_path, notice: I18n.t('movies_collection.movie_added')
    else
      render_edit(target_movie)
    end
  end

  private

  def target_movie
    @target_movie ||= movies_collection.find(params[:id])
  end

  def movies_collection
    @movies_collection ||= Users::MoviesCollection.new(current_user.movies)
  end

  def movie_params
    params
      .require(:movie)
      .permit(:name, :genre, :year, :director, :description)
  end

  def render_edit(movie)
    render :edit, locals: { movie: movie }
  end
end
