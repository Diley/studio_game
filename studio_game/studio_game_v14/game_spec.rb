require_relative 'game'

describe Game do

	before do
		@game = Game.new("Knuckleheads")
		@initial_health = 100
		@player = Player.new("moe", @initial_health)
		@game.add_player(@player)
	end

	it "increases player health when gets 6- a high number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(6)
		@game.play
		expect(@player.health).to eq(@initial_health + 15)
	end

	it "increases player health when gets 5- a high number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(5)
		@game.play
		expect(@player.health).to eq(@initial_health + 15)
	end

	it "skips player when gets 4- a medium number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(4)
		@game.play
		expect(@player.health).to eq(@initial_health)
	end

	it "skips player when gets 3- a medium number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(3)
		@game.play
		expect(@player.health).to eq(@initial_health)
	end

	it "decreases player health when gets 2- a low number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(2)
		@game.play
		expect(@player.health).to eq(@initial_health - 10)
	end

	it "decreases player health when gets 1- a low number on die" do
		allow_any_instance_of(Die).to receive(:roll).and_return(2)
		@game.play
		expect(@player.health).to eq(@initial_health - 10)
	end

	
end


