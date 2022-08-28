class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    if params[:query].present?
      @movies = @movies.search_movies(params[:query])
    end
    respond_to do |format|
      format.html
      format.text { render partial: "movies/list", locals: {movies: @movies}, formats: [:html] }
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
