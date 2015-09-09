require_relative 'fundrequest'
require 'stringio'

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
			@program.request_funding
			expect(@project.funding).to eq(@initial_funding+25)
		end

		it "increases funding amount when gets a new investiment (low number - roll_number = 2)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(2)
			@program.request_funding
			expect(@project.funding).to eq(@initial_funding+25)
		end

		it "decreases funding amount when loses an investiment (medium number - roll_number = 3)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(3)
			@program.request_funding
			expect(@project.funding).to eq(@initial_funding)
		end

		it "keeps the funding amount when don't get nor loses investiment (high number - roll_number = 4)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(4)
			@program.request_funding
			expect(@project.funding).to eq(@initial_funding-15)
		end

		it "keeps the funding amount when don't get nor loses investiment (high number - roll_number = 5)" do
			allow_any_instance_of(Die).to receive(:roll).and_return(5)
			@program.request_funding
			expect(@project.funding).to eq(@initial_funding-15)
		end
	end
end