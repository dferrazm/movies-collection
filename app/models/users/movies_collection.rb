module Users
  class MoviesCollection
    def initialize(user)
      @user = user
    end

    def add(movie_params)
      movie_params.merge!(user: user)
      Movie.create(movie_params)
    end

    private

    attr_reader :user
  end
end
