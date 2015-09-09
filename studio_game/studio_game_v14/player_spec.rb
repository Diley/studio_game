require 'stringio' # Adiciona StringIO 
require_relative 'spec_helper'
require_relative 'player'

describe Player do
	$stdout = StringIO.new

	before do
		@initial_health = 150
		@player = player = Player.new("larry", @initial_health)
	end

	it "has a capitalized name" do
		expect(@player.name).to eq("Larry")
		# player.name.should == "Larry"
	end

	it "has an initial health" do
		expect(@player.health).to eq(150)
	end

	it "has a string representation" do
		expect(@player.to_s).to eq("I'm Larry with a health of 150 and socre of 155.")
	end

	it "computes a score as the sum of its health and length of name" do
		expect(@player.score).to eq(@player.health + @player.name.length)
	end

	it "increases health by 15 when w00ted" do
		@player.w00t
		expect(@player.health).to eq(@initial_health+15)
	end

	it "decreases health by 10 when blammed" do
		@player.blam
		expect(@player.health).to eq(@initial_health-10)
	end

	context "with initial health of 150" do

		before do
			@initial_health = 150
			@player = player = Player.new("larry", @initial_health)
		end

		it "has a strong status" do
			# expect(@player.strong?).to eq(true)
			# expect(@player).to be_strong
			@player.should be_strong
		end
	end

	context "with initial health of 100" do

		before do
			@initial_health = 100
			@player = player = Player.new("larry", @initial_health)
		end

		it "has a strong status" do
			expect(@player.strong?).to eq(false)
			# expect(@player).to be_strong
			# @player.should_not be_strong
		end
	end




end