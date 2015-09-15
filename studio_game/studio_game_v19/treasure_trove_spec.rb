require_relative 'treasure_trove'
require_relative 'spec_helper'

describe Treasure do

  before do
    @treasure = Treasure.new(:hammer, 50)
  end

  it "has a name attribute" do
    expect(@treasure.name).to eq(:hammer)
    # @treasure.name.should == :hammer
  end

  it "has a points attribute" do
    # @treasure.points.should == 50
    expect(@treasure.points).to eq(50)
  end

end

describe TreasureTrove do

  it "has six treasures" do
    # TreasureTrove::TREASURES.size.should == 6
    expect(TreasureTrove::TREASURES.size).to eq(6)
  end

  it "has a pie worth 5 points" do
    # TreasureTrove::TREASURES[0].should == Treasure.new(:pie, 5)
    expect(TreasureTrove::TREASURES[0]).to eq(Treasure.new(:pie, 5))
  end

  it "has a bottle worth 25 points" do
    # TreasureTrove::TREASURES[1].should == Treasure.new(:bottle, 25)
    expect(TreasureTrove::TREASURES[1]).to eq(Treasure.new(:bottle, 25))
  end

  it "has a hammer worth 50 points" do
    # TreasureTrove::TREASURES[2].should == Treasure.new(:hammer, 50)
    expect(TreasureTrove::TREASURES[2]).to eq(Treasure.new(:hammer, 50))
  end

  it "has a skillet worth 100 points" do
    # TreasureTrove::TREASURES[3].should == Treasure.new(:skillet, 100)
    expect(TreasureTrove::TREASURES[3]).to eq(Treasure.new(:skillet, 100))
  end

  it "has a broomstick worth 200 points" do
    # TreasureTrove::TREASURES[4].should == Treasure.new(:broomstick, 200)
    expect(TreasureTrove::TREASURES[4]).to eq(Treasure.new(:broomstick, 200))
  end

  it "has a crowbar worth 400 points" do
    # TreasureTrove::TREASURES[5].should == Treasure.new(:crowbar, 400)
    expect(TreasureTrove::TREASURES[5]).to eq(Treasure.new(:crowbar, 400))
  end

  it "gets a valid treasure" do 
    expect(TreasureTrove::TREASURES.include?(TreasureTrove::random)).to eq(true)
  end

end