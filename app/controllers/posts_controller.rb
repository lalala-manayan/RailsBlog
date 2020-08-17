class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @tags = Tag.all
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.order(created_at: "DESC")
    else
      @posts = Post.order(created_at: "DESC")
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @tags = Tag.all 
  end

  # GET /posts/new
  def new
    @post = Post.new
    @tags = Tag.all 
  end

  # GET /posts/1/edit
  def edit
    @tags = Tag.all 
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
 
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, success: '記事を投稿しました。' } #修正
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to new_post_path, alert: '記事を投稿できませんでした。' } #修正
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, sucess: '記事を更新しました。' } #修正
        format.json { render :show, status: :ok, location: @post }
      else
        format.html {redirect_t edit_post_path, slert: '記事を更新できませんでした。' } #修正
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, error: '記事を削除しました。' } #修正
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :brief, :body, {:tag_ids => []})    #追加
    end
end
