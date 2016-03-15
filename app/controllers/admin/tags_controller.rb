class Admin::TagsController < Admin::ApplicationController
  def new
    @tag =Tag.new
    @tags =Tag.all.order(id: :desc).page params[:page]
  end

  def create
    tags_params[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: 'Tag was successfully created'
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tags_params
      redirect_to new_admin_tag_url, notice: 'Tag was successfully updated'

else
  flash[:alert] = 'There was problem update tag'
  render  :edit
  end
  end

  def show
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to :back, notice: 'The tag deleted successfully'
  end
  private
  def tags_params

    params.require(:tag).permit(:id, :name)
  end
end
