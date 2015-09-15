require_relative 'grant_project'

describe GrantProject do 
  $stdout = StringIO.new

  before do
    @initial_funding = 200
    @project = GrantProject.new("Grant", @initial_funding, 2030)
  end

  it "doesn't lose funds when there is a remove_fund" do
    @project.remove_fund
    expect(@project.funding).to eq(@initial_funding)
  end

end