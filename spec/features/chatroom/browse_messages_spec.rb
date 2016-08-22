require 'features_helper'

feature 'User browse messages' do
  given!(:chatroom) { create :chatroom }
  given!(:messages) { create_list(:message, 101, chatroom: chatroom) }
  given(:user)      { create :user }

  scenario "User sees the last 100 messages when join to chatroom" do
    sign_in(user)
    visit chatrooms_path
    click_on 'Join'

    within '.chatrooms' do
      expect(page).to have_link chatroom.name
    end

    within '.chatroom_title' do
      expect(page).to have_content chatroom.name
    end

    within '.messages' do
      expect(page).to have_selector('.message', count: 100)
      expect(find('div:first-child').text).to have_content messages.second.body
      expect(find('div:last-child').text).to  have_content messages.last.body
    end
  end
end
