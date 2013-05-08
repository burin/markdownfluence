require 'sinatra'
require 'markdown2confluence'


get '/gimme' do
  "<form action='' enctype='multipart/form-data' method='POST'><textarea name='markdown' style='width: 600px; height: 500px; overflow: auto'>**Gimme some markdown**</textarea><input type='submit' /></form> "
end

post '/gimme' do
  markdown = params[:markdown]
  confluence = Kramdown::Document.new(markdown).to_confluence
  return "<h2></h2><form action='' enctype='multipart/form-data' method='POST'><textarea name='markdown' style='width: 600px; height: 500px; overflow: auto'>#{markdown}</textarea><input type='submit' /></form><h2>Confluence Markup</h2><pre>#{confluence}</pre>"
end