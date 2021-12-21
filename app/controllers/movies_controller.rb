class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.search(params[:query]) if params[:query].present?
    @pagy, @movies = pagy @movies.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
  end

  private

  def sort_column
    %w{ title quote rating release_date }.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
  end
end
