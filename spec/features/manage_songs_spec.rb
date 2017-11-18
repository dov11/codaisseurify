require 'rails_helper'

feature 'Manage songs', js: true do
  let(:artist) { create :artist }
  scenario 'add a new song and click on it' do
    visit artist_path(artist)

    fill_in "song_name", with: "Unique Song name"

    page.execute_script("$('#new_song').submit()")

    expect(page).to have_content('Unique Song name')

    sleep(1)

    click_link("1")

    sleep(1)

    expect(page).to have_content('Unique Song name')
  end
end
