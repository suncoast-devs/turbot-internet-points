require "spec_helper"

describe Lita::Handlers::TurbotInternetPoints, lita_handler: true do
  def increment
    send_message("@turbot++")
  end

  it 'increments someones points when they are @mentioned with a ++' do
    increment
    expect(replies.last).to eq ":golf::clap: @turbot's earned their first Internet Point. :golf::clap:"
  end

  it 'sums the increments as they come in' do
    2.times { increment }
    expect(replies.last).to eq "@turbot has 2 Internet Points."
  end

  it 'handles alternative ways of formatting the increments' do
    2.times { send_message("@turbot: ++") }
    expect(replies.last).to eq "@turbot has 2 Internet Points."
  end

  it 'handles pre-increment' do
    2.times { send_message("++@turbot") }
    expect(replies.last).to eq "@turbot has 2 Internet Points."
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
