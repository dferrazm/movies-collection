module Users
  class MoviesCollection
    def initialize(user_movies)
      @user_movies = user_movies
    end

    def recents
      user_movies.order(id: :desc)
    end

    def add(movie_params)
      user_movies.create(movie_params)
    end

    def find(id)
      user_movies.find(id)
    end

    def update_movie(id, movie_params)
      movie = find(id)
      movie.update_attributes(movie_params) and movie
    end

    private

    attr_reader :user_movies
  end
end
