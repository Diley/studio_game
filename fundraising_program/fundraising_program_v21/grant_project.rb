require_relative 'project'

class GrantProject < Project

  def remove_fund
    puts "The project #{@name} is a Grant project and can't have funds removed"
  end

end

if __FILE__ == $0
  grant = GrantProject.new("grant",400,1000)
  puts grant




end