class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @movies = Movie.order(:rating)
    paginate_movies
  end
  
  private
  
  def paginate_movies
    @movies = @movies.page params[:page]
  end
end
