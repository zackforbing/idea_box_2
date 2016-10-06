require 'rails_helper'

describe "User edits an existing idea" do
  scenario 'title and body', js: true do
    idea1 = create(:idea, title: "idea #1", body: 'free bird!')
    idea2 = create(:idea, title: "idea #2", body: 'Spicy jalapeno bacon ipsum dolor amet meatloaf ham hock picanha short ribs, shoulder biltong pork chop corned beef short loin ground round andouille alcatra pork rump ham. Chuck short ribs pastrami, frankfurter shoulder strip steak burgdoggen chicken cow landjaeger beef pork belly. Leberkas rump boudin, ground round pork belly burgdoggen biltong pork chop andouille beef sirloin porchetta tri-tip. Corned beef porchetta cupim prosciutto pork short ribs turkey. Alcatra cow short loin pork loin. Meatloaf pork pork chop turkey tenderloin brisket ground round rump short loin ball tip beef.')

    visit '/'
    
  end
end
