class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json

  before_filter :is_login, only: [:new, :edit]

  def index
    @articles = Article.order("id DESC").page(params[:page]).per(6)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @picture = Picture.where(:article_id => params[:id])
    @ppp = @article.picture.first
    @article.popularity += 1
    @article.save   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new

    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(params[:article])
    @article.popularity =0;
    #binding.pry
    @pic = {image: @article.photo_id}
    @picture = @article.picture.new(@pic)
    @article.photo_id = ""

    respond_to do |format|
      if @article.save
         @picture.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    @picture = Picture.where(:article_id => params[:id])
    current_picture = {image:params[:article]['photo_id']}
    params[:article]['photo_id'] = ''
    #binding.pry

    binding.pry
    respond_to do |format|
      if @article.update_attributes(params[:article])
        @picture.first.update_attributes(current_picture)
        format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @picture = Picture.where(:article_id => params[:id])
    @picture.each do |pic|
        pic.destroy
    end

    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
  def is_login
    if current_user.nil?
	redirect_to signin_path

    end
  end
end
