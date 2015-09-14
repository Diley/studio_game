require 'stringio' # Adiciona StringIO 
require_relative 'spec_helper'
require_relative 'player'
require_relative 'treasure_trove'

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
		@player.found_treasure(Treasure.new(:hammer, 50))
		@player.found_treasure(Treasure.new(:hammer, 50))
		# expect(@player.to_s).to eq("I'm Larry with a health of 150 and socre of 250.")
		expect(@player.to_s).to eq("I'm Larry with a health of 150, points = 100, and score of = 250.")
		
	end

	# it "computes a score as the sum of its health and length of name" do
	# 	expect(@player.score).to eq(@player.health + @player.name.length)
	# end

	it "computes points correctly" do
		@player.found_treasure(Treasure.new(:hammer, 50))
		@player.found_treasure(Treasure.new(:hammer, 50))
		expect(@player.points).to eq(100)
	end

	it "computes a score as the sum of its health and points" do
		@player.found_treasure(Treasure.new(:hammer, 50))
		@player.found_treasure(Treasure.new(:hammer, 50))
		expect(@player.score).to eq(250)
	end

	it "increases health by 15 when w00ted" do
		@player.w00t
		expect(@player.health).to eq(@initial_health+15)
	end

	it "decreases health by 10 when blammed" do
		@player.blam
		expect(@player.health).to eq(@initial_health-10)
	end

	it "has a found_treasures attribute" do
		expect(@player.found_treasures).not_to eq(nil)
	end

	it "returns a hash for found_treasures attribute" do
		expect(@player.found_treasures.class).to eq(Hash.new.class)
	end

	it "finds treasures" do
		treasure = TreasureTrove.random
		@player.found_treasure(treasure)
		expect(@player.found_treasures[treasure.name]).to eq(treasure.points)
	end

	it "yields each found treasure and its total points" do
		@player.found_treasure(Treasure.new(:skillet, 100))
		@player.found_treasure(Treasure.new(:skillet, 100))
		@player.found_treasure(Treasure.new(:hammer, 50))
		@player.found_treasure(Treasure.new(:bottle, 5))
		@player.found_treasure(Treasure.new(:bottle, 5))
		@player.found_treasure(Treasure.new(:bottle, 5))
		@player.found_treasure(Treasure.new(:bottle, 5))
		@player.found_treasure(Treasure.new(:bottle, 5))
		yielded = []
		
		@player.each_found_treasure do |treasure|
			yielded << treasure
		end
		# yielded.should == [
		# 	Treasure.new(:skillet, 200),
		# 	Treasure.new(:hammer, 50),
		# 	Treasure.new(:bottle, 25)
		# ]

		expect(yielded).to eq( [
				Treasure.new(:skillet, 200),
				Treasure.new(:hammer, 50),
				Treasure.new(:bottle, 25)
			])
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

	context "in a collection of players" do
		before do
			@player1 = Player.new("moe", 100)
			@player2 = Player.new("larry", 200)
			@player3 = Player.new("curly", 300)
			@players = [@player1, @player2, @player3]
		end
		it "is sorted by decreasing score" do
			@players.sort.should == [@player3, @player2, @player1]
		end
	end

	context "which got a hammer and a crowbar" do
		before do
			@player = Player.new("moe", 100)
			treasure = TreasureTrove::TREASURES[2]
			@player.found_treasure(treasure)
			treasure = TreasureTrove::TREASURES[5]
			@player.found_treasure(treasure)
		end

		it "has a hammer and a crowbar" do
			expect(@player.found_treasures.keys.include?(:hammer) && @player.found_treasures.keys.include?(:crowbar)).to eq(true)
		end

		it "has 450 points grand (hammer = 50; crowbar = 400)" do
			expect(@player.points).to eq(450)
		end
	end

end