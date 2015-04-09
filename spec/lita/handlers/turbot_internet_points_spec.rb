require "spec_helper"

describe Lita::Handlers::TurbotInternetPoints, lita_handler: true do
  before(:each) do
    Lita::User.create('AAAAAAAA', mention_name: 'turbot', name: 'Turbot')
  end

  def increment
    send_message("<@AAAAAAAA>++")
  end

  it 'increments someones points when they are @mentioned with a ++' do
    increment
    expect(replies.last).to eq "@turbot's now: 1"
  end

  it 'sums the increments as they come in' do
    2.times { increment }
    expect(replies.last).to eq "@turbot's now: 2"
  end

  it 'displays a landmark message when the person is incremented to 10' do
    10.times { increment }
    expect(replies.last).to eq ":rooster: @turbot's a darn tootin' karma machine! :rooster:"
  end

  it 'displays a different landmark at 50' do
    50.times { increment }
    expect(replies.last).to eq ":dromedary_camel: @turbot's a karma sluggin' juggernaut :dromedary_camel:"
  end
end
