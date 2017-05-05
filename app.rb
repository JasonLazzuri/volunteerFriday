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

get('/volunteers')do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

post('/volunteers') do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  @projects = Project.find(project_id)
  @volunteer = Volunteer.new({:name => name, :project_id => project_id}).save()
  erb(:volunteer_success)
end

get('/projects/:id/edit') do
  @projects = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

get('/volunteers/:id') do
  @volunteers = Volunteer.find(params.fetch('id').to_i())
  erb(:project)
end

get('/volunteers/:id/edit') do
  @volunteers = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer_edit)
end


patch('/projects/:id') do
  description = params.fetch("description")
  @projects = Project.find(params.fetch("id").to_i())
  @projects.update({:description => description})
  @volunteers = Volunteer.all()
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  erb(:project)
end

delete('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end
