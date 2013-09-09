require 'sinatra'
require 'markdown2confluence'

style = '<style>body{ color: #333; font: normal 13px/130% Helvetica, arial, sans-serif; }textarea {padding: 9px; border: solid 1px #E5E5E5;outline: 0; font: normal 13px/150% Monaco, courier, monospace; width: 600px; height: 500px; overflow: auto; background: #FFFFFF;}</style>'

get '/' do
   redirect('/gimme')
end

get '/gimme' do
  style + "<h2>Markdown</h2><form action='' enctype='multipart/form-data' method='POST'><textarea name='markdown'>**Gimme some markdown**</textarea><br /><input type='submit' /></form> "
end

post '/gimme' do
  markdown = params[:markdown]
  confluence = Kramdown::Document.new(markdown).to_confluence
  return style + "<h2>Markdown</h2><form action='' enctype='multipart/form-data' method='POST'><textarea name='markdown'>#{markdown}</textarea><br /><input type='submit' /></form><h2>Confluence Markup</h2><textarea name='markdown'>#{confluence}</textarea>"
end