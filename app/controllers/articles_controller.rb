class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy approve ]
  before_action :authenticate_journalist!
  before_action :authenticate_owner!, only: [:approve, :destory]


  def approve
    if @article.approved?
      redirect_to @article, notice: "The article is already approved."
    else
      @article.approved = true
      if @article.save
        redirect_to @article, notice: "The article is successfully approved."
      else
        render :show, status: :unprocessable_entity
      end
    end
  end

  def approval_requests
    @articles = Article.where(approved: false)
  end

  # GET /articles or /articles.json
  def index
    @my_articles = Article.where("journalist_id = ?", current_journalist.id)
    @articles = Article.where("journalist_id != ?", current_journalist.id)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.journalist_id = current_journalist.id
    @article.approved = false

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:journalist_id, :title, :description, :approved)
    end
end
