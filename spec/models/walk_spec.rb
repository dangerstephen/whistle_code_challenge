require 'rails_helper'

RSpec.describe Walk, type: :model do
  it "Walk Saves" do
    Walk.create(
      start_time: "2017-01-01 10:00:00 -0800",
      end_time: "2017-01-01 11:45:00 -0800",
      date: "2017-01-01",
      location: "Fort Funston",
      dog_id: 1
    )
    expect(Walk.count).to eq 1
  end
  it "Walk Doesnt Save..Missing Dog Id" do
    Walk.create(
    start_time: "2017-01-01 10:00:00 -0800",
    end_time: "2017-01-01 11:45:00 -0800",
    date: "2017-01-01",
    location: "Fort Funston",
    )
    expect(Walk.count).to eq 0
  end
  it "does not save when times overlap" do
    Walk.create(
      start_time: "2017-01-01 08:14:33 -0800",
      end_time: "2017-01-01 08:30:00 -0800",
      date: "2017-01-01",
      location: "Fort Baker",
      dog_id: 1
    )

   Walk.create(
     start_time: "2017-01-01 08:20:00 -0800",
     end_time: "2017-01-01 08:40:00 -0800",
     date: "2017-01-01",
     location: "Fort Baker",
     dog_id: 1
   )
   expect(Walk.count).to eq 1
 end
end
