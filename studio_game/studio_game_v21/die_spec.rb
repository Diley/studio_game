require_relative 'die'

describe Die do

  before do
    @die = Die.new
  end

  it "has a defined number" do 
    expect(@die.number >= 1 && @die.number <=6).to eq(true)
  end


end