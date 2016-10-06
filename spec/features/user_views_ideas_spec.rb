require 'rails_helper'

describe "User sees a list of ideas" do
  scenario 'the ideas have titles, bodies, and qualities, and are only up to 100 characters long', js: true do
    idea1 = create(:idea, title: "idea #1", body: 'free bird!')
    idea2 = create(:idea, title: "idea #2", body: 'Spicy jalapeno bacon ipsum dolor amet meatloaf ham hock picanha short ribs, shoulder biltong pork chop corned beef short loin ground round andouille alcatra pork rump ham. Chuck short ribs pastrami, frankfurter shoulder strip steak burgdoggen chicken cow landjaeger beef pork belly. Leberkas rump boudin, ground round pork belly burgdoggen biltong pork chop andouille beef sirloin porchetta tri-tip. Corned beef porchetta cupim prosciutto pork short ribs turkey. Alcatra cow short loin pork loin. Meatloaf pork pork chop turkey tenderloin brisket ground round rump short loin ball tip beef.')

    visit '/'

    within('div#all-ideas.idea') do
      require "pry"; binding.pry
      expect(page).to have_css('#idea-2')
      expect(page).to have_content('this is idea #2')
      expect(page).to have_content('swill')
      expect(page).to have_content('Spicy jalapeno bacon ipsum dolor amet meatloaf ham hock picanha short ribs, shoulder biltong pork ...')
    end
  end
end

# * See a list of all existing ideas, including the title, body, and quality for each idea. (2 points, mandatory for specification adherence)
# * Idea bodies longer than 100 characters should be truncated to the nearest word. (5 points)
# * Ideas should appear in descending chronological order (with the most recently created idea at the top). (3 points)
