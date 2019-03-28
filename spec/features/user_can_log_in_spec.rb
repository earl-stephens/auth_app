require 'rails_helper'

describe "from the login page" do
  it "lets the user create a new log in" do
    name = "Bob"
    email = "email1"
    password = "password1"

    visit new_user_path

    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: password

    click_on "Create User"

    new_user = User.last
    expect(new_user.name).to eq(name)
    expect(new_user.email).to eq(email)
    expect(new_user.password).to eq(password)
  end

  it "can log in a registered user" do

    user1 = User.create(name: "Bob", email: "email1", password: "password1")
    user2 = User.create(name: "Bill", email: "email2", password: "password2")
    visit login_path


    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    # save_and_open_page
    click_button "Submit"
    expect(User.authenticate(user1.email, user1.password)).to eq(true)
    # save_and_open_page
    expect(page).to have_content("You are logged in.")
    expect(current_path).to eq(root_path)

    #sad path test
    visit login_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user2.password
    click_on "Submit"

    expect(User.authenticate(user1.email, user2.password)).to eq(false)
    expect(page).to have_content("You are not logged in.")
    expect(current_path).to eq(sessions_path)
  end

  it "can log out a registered user" do
    user1 = User.create(name: "Bob", email: "email1", password: "password1")
    visit login_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password

    click_button "Submit"
    # binding.pry

    expect(current_path).to eq(root_path)

    click_link "Log Out"

    expect(page).to have_content("You are now logged out.")
    expect(current_path).to eq(root_path)
  end
end
