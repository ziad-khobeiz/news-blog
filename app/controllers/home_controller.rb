class HomeController < ApplicationController
  def index
    @articles = Article.where(approved: true)
  end
end
