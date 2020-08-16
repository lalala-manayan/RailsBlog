class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  # GET /tags/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
 
    respond_to do |format|
      if @tag.save
        format.html { redirect_to new_tag_path, success: 'タグを作成しました。' } #編集
        format.json { render :new, status: :created, location: @tag }
      else
        format.html { redirect_to new_tag_path, alert: 'タグを作成できませんでした。' } #編集
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to new_tag_path, success: 'タグを更新しました。' } #編集
        format.json { render :new, status: :ok, location: @tag }
      else
        format.html { redirect_to edit_tag_path, alert: 'タグを編集できませんでした。' } #編集
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to new_tag_path, alert: 'タグを削除しました。' } #編集
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name, :color)
    end
end
