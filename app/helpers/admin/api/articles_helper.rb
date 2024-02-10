module Admin::Api::ArticlesHelper
  def associate_images(article)
    images = article.images
    body_content = article.body.to_s
    new_image_patterns = body_content.scan(/\!\[Image_(\d+)\]\([^\)]+\)/).flatten.map(&:to_i)

    images_delete = []
    new_image_patterns.each do |image_id|
      image = images.find { |img| img.id == image_id }
      # Asociar nuevas imágenes
      unless image
        new_image = Image.find(image_id)
        article.images << new_image
      # Desasociar imágenes que ya no están presentes en los nuevos patrones
      # else
      #   images_delete << image.id
      end
    end
    images.each do |image|
      images_delete << image.id unless new_image_patterns.include?(image.id)
    end
    Image.where(id: images_delete).update(article_id: nil) if images_delete
  end

end