require 'stringio'
require_relative 'fundrequest'
require_relative 'pledge_pool'

describe FundRequest do
	$stdout = StringIO.new
	
	context "Program with only one project" do
		before do
			@initial_funding = 100
			@target_funding = 230
			@project = Project.new('ABC', @initial_funding, @target_funding)
			@program = FundRequest.new('Start-ups raising program')
			@program.add_project(@project)
		end

		it "increases funding amount when gets a new investiment (low number - roll_number = 1)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(1)
			@program.request_funding(1)
			expect(@project.funding).to eq(@initial_funding+25)
		end

		it "increases funding amount when gets a new investiment (low number - roll_number = 2)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(2)
			@program.request_funding(1)
			expect(@project.funding).to eq(@initial_funding+25)
		end

		it "decreases funding amount when loses an investiment (medium number - roll_number = 3)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(3)
			@program.request_funding(1)
			expect(@project.funding).to eq(@initial_funding)
		end

		it "keeps the funding amount when don't get nor loses investiment (high number - roll_number = 4)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(4)
			@program.request_funding(1)
			expect(@project.funding).to eq(@initial_funding-15)
		end

		it "keeps the funding amount when don't get nor loses investiment (high number - roll_number = 5)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(5)
			@program.request_funding(1)
			expect(@project.funding).to eq(@initial_funding-15)
		end

		it "computes total points as the sum of all player points" do
			fund_program = FundRequest.new("VC-Friendly Start-up Projects")
			project1 = Project.new( 'parkav', 669, 700 );
			project2 = Project.new( 'plate iq', 654, 700 );
			project3 = Project.new( 'bagaveev', 1128, 1600 );
			project4 = Project.new( 'flaviar', 2912, 3400 );

			fund_program.add_project(project1)
			fund_program.add_project(project2)
			fund_program.add_project(project3)
			fund_program.add_project(project4)

			project1.add_pledge(Pledge.new(:bronze, 50))
			project2.add_pledge(Pledge.new(:bronze, 50))
			project3.add_pledge(Pledge.new(:bronze, 50))
			# game.total_points.should == 500
			expect(fund_program.total_pledges_amount).to eq(150)
		end
	end
end