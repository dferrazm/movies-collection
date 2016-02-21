module Users
  class MoviesCollection
    def initialize(user_movies)
      @user_movies = user_movies
    end

    def recents(count: DEFAULT_RECENTS_COUNT, offset: 0)
      user_movies.includes(:pictures).limit(count).offset(offset).order(id: :desc)
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

    DEFAULT_RECENTS_COUNT = 20

    attr_reader :user_movies
  end
end
