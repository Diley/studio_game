require 'fundraising_program/half_way_project'

module FundraisingProgram
  describe HalfWayProject do 
    $stdout = StringIO.new

    context "Reaches half of the target_funding" do 

      before do
        @initial_funding = 400
        @target_funding = 1000
        @extra_funding = 500
        @project = HalfWayProject.new("half way", @initial_funding, @target_funding, @extra_funding)
      end

      it "recognizes when half targe funding is reached" do
        funding1 = 400
        funding2 = 500
        expect(@project.half_way_reached?(funding1,funding2)).to eq(true)
      end

      it "doens't reach half of the target_funding" do
        1.upto(3) { @project.add_fund }
        expect(@project.total_funds).to eq(@initial_funding + 3*25)

      end
      
      it "reaches half of the target_funding after add_fund" do 
        turns = 5
        1.upto(turns) { @project.add_fund }
        expect(@project.total_funds).to eq(@initial_funding + turns*25 + @extra_funding)
      end
    end

    context "doesn't reaches half of the target_funding" do

      before do
        @initial_funding = 100
        @target_funding = 1000
        @extra_funding = 500
        @project = HalfWayProject.new("half way", @initial_funding, @target_funding, @extra_funding)
      end

      it "getting insufficient funds" do
        turns = 4
        1.upto(turns) { @project.add_fund }
        expect(@project.total_funds).to eq(@initial_funding + turns*25)
      end

      it "gettting insufficient pledges" do
        turns = 3
        1.upto(turns) { @project.add_pledge(Pledge.new(:bronze,50)) }
        expect(@project.total_funds).to eq(@initial_funding + turns*50)
      end
    end
  end
end