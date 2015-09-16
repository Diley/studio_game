module FundraisingProgram
  class Die
  	attr_reader :number

  	def initialize
  		roll
  	end

  	def roll
  		rand(1..5)
  	end
  end
end