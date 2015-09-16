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

end