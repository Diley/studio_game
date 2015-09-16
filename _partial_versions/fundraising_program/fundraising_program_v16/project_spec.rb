require_relative 'spec_helper'
require_relative 'project'

describe Project do

	$stdout = StringIO.new	# evita que puts seja impresso no terminal ao rodar rspec

	before do
		@initial_funding = 100
		@target_funding = 200
		@project = Project.new('ABC', @initial_funding, @target_funding)
	end

	it "has an initial target funding amount" do
		expect(@project.target_funding).to eq(200)
	end

	it "computes the total funding outsdanding as the target funding amount minus the funding amount" do
		expect(@project.funding_left).to eq(@project.target_funding - @project.funding)
	end

	it "increases funds by 25 when funds are added" do
		@project.add_fund
		expect(@project.funding).to eq(@initial_funding + 25)
	end


	it "decreases funds by 15 when funds are removed" do
		@project.remove_fund
		expect(@project.funding).to eq(@initial_funding - 15)
	end

	it "calculates left funding corectly" do
			expect(@project.funding_left).to eq(@project.target_funding - @project.funding)
	end

	it "is fully funded" do
		expect(@project).not_to be_fully_funded
	end

	

	context "created with default value for amount funding amount and target funding amount" do

		before do 
			@project = Project.new('ABC')
		end

		it "has a default value of 0 for funding amount" do
			expect(@project.funding).to eq(0)
		end

		it "has a default value of 1000 for target funding amount" do
			expect(@project.target_funding).to eq(1000)
		end
	end


	context "fully funded project" do

		before do 
			@initial_funding = 100
			@target_funding = 200
			@project = Project.new('ABC', @initial_funding, @target_funding)
		end


		it "is fully funded" do
			expect(@project).not_to be_fully_funded
		end
	end

	context "in a collection of projects" do
		before do
			project1 = Project.new( 'parkav', 1000, 100 );
			project2 = Project.new( 'plate iq', 1500, 100 );
			project3 = Project.new( 'bagaveev', 2000, 100 );
			project4 = Project.new( 'flaviar', 3000, 100 );
			@projects = [@project1, @project2, @project3, @project4]
		end
		it "is sorted by decreasing funding_left" do
			@projects.sort.should == [@project4, @project3, @project2, @project3]
		end
	end


end