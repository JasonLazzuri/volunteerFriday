require('spec_helper')

describe(Project) do
  describe('.all')do
    it('starts off with no lists')do
      expect(Project.all()).to(eq([]))
    end
  end

  describe('#description') do
    it('tells you the description of the project')do
      project = Project.new({:description => "Build a building", :id => nil})
      expect(project.description()).to(eq("Build a building"))
    end
  end

  describe('#save') do
    it('lets you save projects to the database')do
      project = Project.new({:description => "Build a building", :id => nil})
      project.save()
      expect(Project.all()).to(eq([project]))
    end
  end

  describe('#==') do
    it("is the same project if it has the same name")do
      project1 = Project.new({:description => "Build a building", :id => nil})
      project2 = Project.new({:description => "Build a building", :id => nil})
      expect(project1).to(eq(project2))
    end
  end

  describe('.find')do
    it('returns a project by its ID')do
      test_project = Project.new({:description => "Build a Building", :id => nil})
      test_project.save()
      test_project2 = Project.new({:description => "Buy a House", :id => nil})
      test_project2.save()
      expect(Project.find(test_project.id())).to(eq(test_project))
    end
  end

  describe("#volunteers") do
    it('returns and array of volunteers for that project') do
      test_project = Project.new({:description => "Build a building", :id => nil})
      test_project.save()
      test_volunteer = Volunteer.new({:name => "Jason", :project_id => test_project.id()})
      test_volunteer.save()
      test_volunteer2 = Volunteer.new({:name => "Bob", :project_id => test_project.id()})
      test_volunteer2.save()
      expect(test_project.volunteers()).to(eq([test_volunteer, test_volunteer2]))
    end
  end


end
