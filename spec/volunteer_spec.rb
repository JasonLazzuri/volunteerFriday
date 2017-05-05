require('spec_helper')

describe(Volunteer) do
  describe('.all')do
    it('is empty at first')do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new({:name => "Bob", :project_id => 1})
      test_volunteer.save()
      expect(Volunteer.all()).to(eq([test_volunteer]))
    end
  end

  describe('#name') do
    it ('lets you read the name of the volunteer') do
      test_volunteer = Volunteer.new({:name => "Bob", :project_id => 1})
      expect(test_volunteer.name()).to(eq("Bob"))
    end
  end

  describe("#project_id") do
    it("lets you read the project ID")do
      test_volunteer = Volunteer.new({:name => "Bob", :project_id => 1})
      expect(test_volunteer.project_id).to(eq(1))
    end
  end

  describe('#==') do
    it("is the same volunteer if it has the same name and project ID")do
      vol1 = Volunteer.new({:name => "Bob", :project_id => 1})
      vol2 = Volunteer.new({:name => "Bob", :project_id => 1})
      expect(vol1).to(eq(vol2))
    end
  end


end
