json.array! @images do |image|
  json.extract! image,
                :id

  json.article_id image.imageable_id if image.imageable.present? && image.imageable_type == 'Article'
  json.url url_for(image.file)
end

