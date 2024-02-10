class Admin::Api::ImagesController < ApiController
  before_action :set_image, only: [:destroy]

  def index
    @images = Image.where(article_id: nil)
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      render json: @image, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def update
    if @imagen.update(image_params)
      render json: @imagen
    else
      render json: @imagen.errors, status: :unprocessable_entity
    end
  end 

  def destroy
    @image.destroy
    head :no_content
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.permit(:file, :article_id)
  end
end