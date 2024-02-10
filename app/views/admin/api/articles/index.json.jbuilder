json.data do
  json.array! @articles do |article|
    json.extract! article,
                  :id,
                  :title
  end
end
json.total_count @articles.total_count
json.total_pages @articles.total_pages
