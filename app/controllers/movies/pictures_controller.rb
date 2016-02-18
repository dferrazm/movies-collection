module Movies
  class PicturesController < AuthenticatedController
    include MoviesHandling

    def index
      @pictures = target_movie.pictures
    end

    def create
      @picture = target_movie.add_picture(picture_params)
    end

    def destroy
      target_movie.remove_picture(params[:id])
      render nothing: true
    end

    private

    def picture_params
      params.require(:picture).permit(:image)
    end
  end
end
