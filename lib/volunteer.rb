class Volunteer
  attr_reader(:name, :project_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  define_singleton_method(:all) do
    returned_volunteers = DB.exec("SELECT * FROM volunteers")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i()
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id}))
    end
    volunteers
  end

  define_method(:save) do
    DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id});")
  end

  define_method(:==) do |another_volunteer|
    self.name().==(another_volunteer.name()).&(self.project_id().==(another_volunteer.project_id()))
  end
end
