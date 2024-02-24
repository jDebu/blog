json.array! @articles do |article|
  json.extract! article,
                :id,
                :title,
                :body,
                :slug,
                :summary,
                :created_at,
                :updated_at
  cover_image = article.cover_image
  json.cover_image url_for(cover_image.file)
end
