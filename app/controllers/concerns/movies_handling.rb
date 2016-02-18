module MoviesHandling
  def target_movie
    @target_movie ||= movies_collection.find(params[:movie_id] || params[:id])
  end

  def movies_collection
    @movies_collection ||= Users::MoviesCollection.new(current_user.movies)
  end
end
