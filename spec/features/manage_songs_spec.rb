require 'rails_helper'

feature 'Manage songs', js: true do
  let(:artist) { create :artist }
  scenario 'add a new song and click on it' do
    visit artist_path(artist)

    fill_in "song_name", with: "Unique Song name"

    page.execute_script("$('#new_song').submit()")

    expect(page).to have_content('Unique Song name')

    sleep(1)

    click_link("link-to-1")

    sleep(1)

    expect(page).to have_content('Unique Song name')
  end
  scenario 'delete a song' do
    visit artist_path(artist)
    fill_in "song_name", with: "Unique Song name"

    page.execute_script("$('#new_song').submit()")

    expect(page).to have_content('Unique Song name')

    sleep(1)
    page.find('a', text: 'Delete Song').click

    sleep(1)

    expect(page).to have_no_content('Unique Song name')
  end

  scenario 'delete all songs' do
    visit artist_path(artist)
    fill_in "song_name", with: "Song1"
    page.execute_script("$('#new_song').submit()")

    fill_in "song_name", with: "Song2"
    page.execute_script("$('#new_song').submit()")

    expect(page).to have_content('Song1')
    expect(page).to have_content('Song2')

    sleep(1)

    page.find('span', text: 'Delete All Songs').click

    sleep(1)

    expect(page).to have_no_content('Song1')
    expect(page).to have_no_content('Song2')
  end
end
