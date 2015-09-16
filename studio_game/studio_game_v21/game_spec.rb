require_relative 'game'

describe Game do

	$stdout = StringIO.new

	before do
		@game = Game.new("Knuckleheads")
		@initial_health = 100
		@player = Player.new("moe", @initial_health)
		@game.add_player(@player)
	end

	it "increases player health when gets 6- a high number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(6)
		@game.play(1)
		expect(@player.health).to eq(@initial_health + 15)
	end

	it "increases player health when gets 5- a high number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(5)
		@game.play(1)
		expect(@player.health).to eq(@initial_health + 15)
	end

	it "skips player when gets 4- a medium number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(4)
		@game.play(1)
		expect(@player.health).to eq(@initial_health)
	end

	it "skips player when gets 3- a medium number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(3)
		@game.play(1)
		expect(@player.health).to eq(@initial_health)
	end

	it "decreases player health when gets 2- a low number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(2)
		@game.play(1)
		expect(@player.health).to eq(@initial_health - 10)
	end

	it "decreases player health when gets 1- a low number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(2)
		@game.play(1)
		expect(@player.health).to eq(@initial_health - 10)
	end

	it "assigns a treasure for points during a player's turn" do
		game = Game.new("Knuckleheads")
		player = Player.new("moe")
		game.add_player(player)
		game.play(1)
		expect(player.points).not_to eq(0)
		# expect(player.points).to eq(2)
		# player.points.should_not be_zero
		# or use alternate expectation syntax:
		# expect(player.points).not_to be_zero
	end

	it "computes total points as the sum of all player points" do
		game = Game.new("Knuckleheads")
		player1 = Player.new("moe")
		player2 = Player.new("larry")
		game.add_player(player1)
		game.add_player(player2)
		player1.found_treasure(Treasure.new(:hammer, 50))
		player1.found_treasure(Treasure.new(:hammer, 50))
		player2.found_treasure(Treasure.new(:crowbar, 400))
		# game.total_points.should == 500
		expect(game.total_points).to eq(500)
	end
end

