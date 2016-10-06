require 'rails_helper'

describe "User sees a list of ideas" do
  scenario 'the ideas have titles, bodies, and qualities, and are only up to 100 characters long', js: true do
    idea1 = create(:idea, title: "idea #1", body: 'free bird!')
    idea2 = create(:idea, title: "idea #2", body: 'Spicy jalapeno bacon ipsum dolor amet meatloaf ham hock picanha short ribs, shoulder biltong pork chop corned beef short loin ground round andouille alcatra pork rump ham. Chuck short ribs pastrami, frankfurter shoulder strip steak burgdoggen chicken cow landjaeger beef pork belly. Leberkas rump boudin, ground round pork belly burgdoggen biltong pork chop andouille beef sirloin porchetta tri-tip. Corned beef porchetta cupim prosciutto pork short ribs turkey. Alcatra cow short loin pork loin. Meatloaf pork pork chop turkey tenderloin brisket ground round rump short loin ball tip beef.')

    visit '/'

    within('#all-ideas div:nth-child(1)') do
      require "pry"; binding.pry
      # expect(page).to have_css('#idea-2')
      expect(page).to have_content('idea #2')
      expect(page).to have_content('swill')
      expect(page).to have_content('Spicy jalapeno bacon ipsum dolor amet meatloaf ham hock picanha short ribs, shoulder biltong pork ...')
    end
  end
end
