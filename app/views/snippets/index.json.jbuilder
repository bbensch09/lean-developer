json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :email, :body, :rating
  json.url snippet_url(snippet, format: :json)
end
