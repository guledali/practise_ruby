require("rspec")
require_relative("../region.rb")

RSpec.describe "Add 'först till kvarn' field to parser" do
  before do
    @uppsala = Region.new(
      name: "Uppsala",
      description: "description",
      qualification: "description",
      last_application_date: "",
    )
  end

  it "If region has NO last application date, assign to 'för till kvarn'" do
    expect(@uppsala.last_application_date).to be_empty

    @uppsala.assign_first_to_quarter

    expect(@uppsala.first_to_quarter).to eq true
  end

  it "if last_application_date has date, then first_to_quarter should be false" do
    @uppsala.last_application_date = Time.now.strftime("%Y-%d-%m")

    @uppsala.assign_first_to_quarter

    expect(@uppsala.last_application_date).not_to be_empty

    expect(@uppsala.first_to_quarter).to eq false
  end
end
