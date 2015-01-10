json.array!(@books) do |book|
  json.extract! book, :id, :subject, :title, :file, :description, :user_id
  json.url book_url(book, format: :json)
end
