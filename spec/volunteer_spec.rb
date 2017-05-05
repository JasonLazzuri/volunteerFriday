require('spec_helper')
require('pry')

describe(Volunteer) do
  describe('.all')do
    it('is empty at first')do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new({:name => "Bob", :project_id => 1, :id => nil})
      test_volunteer.save()
      expect(Volunteer.all()).to(eq([test_volunteer]))
    end
  end

  describe('#name') do
    it ('lets you read the name of the volunteer') do
      test_volunteer = Volunteer.new({:name => "Bob", :project_id => 1, :id => nil})
      expect(test_volunteer.name()).to(eq("Bob"))
    end
  end

  describe("#project_id") do
    it("lets you read the project ID")do
      test_volunteer = Volunteer.new({:name => "Bob", :project_id => 1, :id => nil})
      expect(test_volunteer.project_id).to(eq(1))
    end
  end

  describe('#==') do
    it("is the same volunteer if it has the same name and project ID")do
      vol1 = Volunteer.new({:name => "Bob", :project_id => 1, :id => nil})
      vol2 = Volunteer.new({:name => "Bob", :project_id => 1, :id => nil})
      expect(vol1).to(eq(vol2))
    end
  end

  describe('#update')do
    it('lets you update the name of the volunteer')do
      volunteer = Volunteer.new({:name => "Jason", :project_id => 1, :id => nil})
      volunteer.save()
      volunteer.update({:name => "JASONE"})
      expect(volunteer.name()).to(eq("JASONE"))
    end
  end

  describe('#find')do
    it('lets you find the id of a volunteer')do
      volunteer_test = Volunteer.new({:name => "Jason", :project_id => 1, :id => nil})
      volunteer_test.save()
      volunteer2 = Volunteer.new({:name => "Bill", :project_id => 1, :id => nil})
      volunteer2.save()
      expect(Volunteer.find(volunteer_test.id())).to(eq(volunteer_test))
    end
  end


  describe('#delete')do
    it ('lets you delete a project from the list')do
      project = Project.new({:description => "Build a building", :id =>nil})
      project.save()
      project2 = Project.new({:description => "buy a house", :id => nil})
      project2.save()
      project.delete()
      expect(Project.all()).to(eq([project2]))
    end
  end
end
