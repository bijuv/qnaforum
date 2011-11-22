class PostsController < ApplicationController
  
  
  def add_rate
     @post = Post.find(params[:id])
     @query= 1
        @post.rating += 1
     if @post.save
       redirect_to :back
       end
  end
  def less_rate
     @post = Post.find(params[:id])
        @post.rating -= 1
     if @post.save
       redirect_to :back
     end
  end
  
  # GET /posts
  # GET /posts.xml
  def index
   #@posts= Post.order(:'rating desc')============================

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    #@post = Post.find(params[:id])============================

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @user = User.find_by_email(session[:user_id])
    @post = Post.create(:answer => params[:answer], :query_id => params[:query_id],:user_id => @user.id)
    @query= params[:query_id]
    respond_to do |format|
      if @post.save
         format.html {redirect_to :back}
        else
         flash[:notice]= "Message failed to save."
         format.html{redirect_to :back}
      end
    end
  end
  

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
