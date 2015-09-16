require_relative 'project'

module FundraisingProgram
  class HalfWayProject < Project 

    def initialize(name, funding, target_funding, extra_funding=500)
      super(name,funding,target_funding)
      @extra_funding = extra_funding
    end

    def half_way_reached?(funding1, funding2)
      (funding1 < target_funding / 2) && (funding2 >= target_funding/2)
    end

    def add_fund
      funding1 = total_funds
      super
      funding2 = total_funds
      if half_way_reached?(funding1, funding2)
        @funding += @extra_funding
      end
    end

    def add_pledge(pledge)
      funding1 = total_funds
      super(pledge)
      funding2 = total_funds
      if half_way_reached?(funding1, funding2)
        @funding += @extra_funding
      end
    end

  end
end
