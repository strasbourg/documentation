set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
end

activate :livereload
activate :directory_indexes

activate :syntax

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote = 'strasbourg'
  deploy.branch = 'gh-pages'
end
