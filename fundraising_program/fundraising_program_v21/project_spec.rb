require_relative 'spec_helper'
require_relative 'project'
require_relative 'pledge_pool'

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

	it "has a pledge_accumulator" do
		expect(@project.pledges_accumulated.class).to eq(Hash.new.class)
	end

	it "adds a new pledge" do
		pledge = PledgePool.random
		@project.add_pledge(pledge)
		expect(@project.pledges_accumulated.keys.include?(pledge.name)).to eq(true)
	end

	it "yields each pledge and its total points" do
		@project.add_pledge(Pledge.new(:bronze, 50))
		@project.add_pledge(Pledge.new(:bronze, 50))
		@project.add_pledge(Pledge.new(:silver, 75))
		@project.add_pledge(Pledge.new(:silver, 75))
		@project.add_pledge(Pledge.new(:silver, 75))
		@project.add_pledge(Pledge.new(:gold, 100))
		@project.add_pledge(Pledge.new(:gold, 100))
		yielded = []
		
		@project.each_pledge do |pledge|
			yielded << pledge
		end
		# yielded.should == [
		# 	Treasure.new(:skillet, 200),
		# 	Treasure.new(:hammer, 50),
		# 	Treasure.new(:bottle, 25)
		# ]

		expect(yielded).to eq( [
				Pledge.new(:bronze, 100),
				Pledge.new(:silver, 225),
				Pledge.new(:gold, 200)
			])
	end

	it "creates a project from a csv line" do
		line = "Project1,100,0"
		expect(puts Project.from_csv(line)).to eq(puts Project.new("Project1",100,0))
	end

	context "which got a bronze and a silver pledge" do

		before do
			@initial_funding = 100
			@target_funding = 200
			@project = Project.new('ABC', @initial_funding, @target_funding)
			@project.add_pledge(PledgePool::PLEDGES[0])
			@project.add_pledge(PledgePool::PLEDGES[1])
		end

		it "has $125 in pladges" do
			expect(@project.pledges_amount).to eq(PledgePool::PLEDGES[0].amount + PledgePool::PLEDGES[1].amount)
		end
	end

	context "with initial fund of 100, got a bronze pledge and received $100 in funds" do

		before do
			@initial_funding = 100
			@target_funding = 200
			@project = Project.new('ABC', @initial_funding, @target_funding)
			@project.add_pledge(PledgePool::PLEDGES[0])	# adds a bronze pledge ($50)
			@project.add_fund
		end

		it "has $175 as total funds" do
			expect(@project.total_funds).to eq(175)
		end
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