module Fundable

  def add_fund
    self.funding += 25
    puts "O projeto #{self.name.upcase} recebeu mais fundos =D."
  end

  def remove_fund
    self.funding -= 15
    puts "O projeto #{self.name.upcase} perdeu alguns fundos =(."
  end
  
  def fully_funded?
    self.total_funds >= self.target_funding
  end

end