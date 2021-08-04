class HomeController < ApplicationController
  def index
    results = ActiveRecord::Base.connection.execute(
    "select journalist_id from Articles
    where Articles.approved = true
    group by journalist_id
    order by count(*) DESC")
    @articles = Array.new
    results.each do |result|
        @articles.concat(Article.where(approved: true, journalist_id: result["journalist_id"]).to_a)
    end
  end
end
