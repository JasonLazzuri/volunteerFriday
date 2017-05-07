require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")
require('pry')

DB = PG.connect({:dbname =>"volunteer_tracker"})


#index links page starts
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

get('/volunteers')do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

##index page links end





## projects pages

#adds a project to the list
post('/projects')do
  description = params.fetch('description')
  project = Project.new({:description => description, :id => nil}).save()
  erb(:project_success)
end

#gets to the individual projects page and lists all the volunteers
get('/projects/:id') do
  @projects = Project.find(params.fetch('id').to_i())
  erb(:project)
end

#submits a new volunteer to the project
post('/volunteers') do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  @volunteers = Volunteer.new({:id => nil, :name => name, :project_id => project_id}).save()
  @projects = Project.find(project_id)
  erb(:volunteer_success)
end



#edit projects form
get('/projects/:id/edit') do
  @projects = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

#updates the projects name from the form
patch('/projects/:id') do
  description = params.fetch("description")
  @projects = Project.find(params.fetch("id").to_i())
  @projects.update({:description => description})
  erb(:project)
end

#deletes projects
delete('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end

## ends projects pages






get('/volunteer/:id/edit') do
  @volunteers = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer_edit)
end

patch('/volunteers/:id') do
  name = params.fetch("name")
  @volunteers = Volunteer.find(params.fetch("id").to_i())
  @volunteers.update({:name => name})
  erb(:volunteers)
end
