json.array! @images do |image|
  json.extract! image,
                :id,
                :article_id
  json.url url_for(image.file)
end

