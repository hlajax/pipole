class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_lecteur!, except:[:index, :show, :new]

  # GET /articles
  # GET /articles.json
  def index
    @une = Article.all.order("created_at DESC").limit(1)
    @tops = Article.all.limit(4).offset(1).order("created_at DESC")
    @articles = Article.all.offset(5).order("created_at DESC")
    @politune = Article.where(rubrique: [1]).limit(1).order("created_at DESC")
    @sportune = Article.where(rubrique: [2]).limit(1).order("created_at DESC")
    @celebune = Article.where(rubrique: [3]).limit(1).order("created_at DESC")
    @politiques = Article.where(rubrique: [1]).limit(4).offset(1).order("created_at DESC")
    @sports = Article.where(rubrique: [2]).limit(2).offset(1).order("created_at DESC")
    @celebs = Article.where(rubrique: [3]).limit(2).offset(1).order("created_at DESC")
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articles_similaires = Article.where(rubrique_id: @article.rubrique_id).limit(6).order("created_at DESC")
  end
  #votes
  def upvote
  @article = Article.friendly.find(params[:id])
  @article.liked_by current_lecteur
  redirect_to @article
end

def downvote
  @article = Article.friendly.find(params[:id])
  @article.downvote_from current_lecteur
  redirect_to @article
end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:titre, :contenu, :agree, :disagree, :image, :rubrique_id)
    end
end
