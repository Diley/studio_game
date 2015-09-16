require 'fundraising_program/pledge_pool'
# require_relative 'spec_helper'

module FundraisingProgram
  describe Pledge do

    before do
      @pledge = Pledge.new(:bronze, 50)
    end

    it "has a name attribute" do
      expect(@pledge.name).to eq(:bronze)
      # @treasure.name.should == :hammer
    end

    it "has an amount attribute" do
      # @treasure.points.should == 50
      expect(@pledge.amount).to eq(50)
    end

  end

  describe PledgePool do

    it "has tree levels" do
      expect(PledgePool::PLEDGES.size).to eq(3)
    end

    it "has a bronze level worth $50" do
      expect(PledgePool::PLEDGES[0]).to eq(Pledge.new(:bronze, 50))
    end

    it "has a silver level worth $75" do
      expect(PledgePool::PLEDGES[1]).to eq(Pledge.new(:silver, 75))
    end

    it "has a gold level worth $100" do
      expect(PledgePool::PLEDGES[2]).to eq(Pledge.new(:gold, 100))
    end

    it "gets a valid pledge ramdomly" do 
      expect(PledgePool::PLEDGES.include?(PledgePool::random)).to eq(true)
    end

  end
end