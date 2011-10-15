class PostsController < ApplicationController
  
  respond_to :xml, :text, :html
  respond_to :rss, :atom, :only => [:index]
  
  before_filter :authenticate, :except => :index
  
  def index
    @posts = Post.all
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])   
    respond_with(@posts)
  end
    
  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
      respond_with(@posts)
    end
    

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  
  
  def create
    @post = Post.new(params[:post])
    @post.save
    flash[:notice] = "post saved!"
    flash[:alert] = " HIgh Alert!"
    expire_page :action => :index
    respond_with(@post)
  end
  
  
  


  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
