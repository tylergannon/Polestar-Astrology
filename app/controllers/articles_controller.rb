class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all
    respond_with(@articles)
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    respond_with(@article)
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    respond_with(@article)
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    flash[:notice] = 'Article was successfully created.' if @article.save
    respond_with(@article)
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    flash[:notice] = 'Article was successfully updated.' if @article.update(params[:article])
    respond_with(@article)
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_with(@article)
  end
end
