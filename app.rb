require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")
require('pry')

DB = PG.connect({:dbname =>"volunteer_tracker"})

get('/')do
  erb(:index)
end

get('/projects')do
  @projects = Project.all()
  erb(:projects)
end

get('/projects/new')do
  erb(:project_form)
end

post('/projects')do
  description = params.fetch('description')
  project = Project.new({:description => description, :id => nil})
  project.save()
  erb(:project_success)
end

get('/projects/:id') do
  @projects = Project.find(params.fetch('id').to_i())
  erb(:project)
end
