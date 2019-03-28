require 'rails_helper'

describe "auth user can see stuff" do
  it "can let auth user see secret page" do
    user1 = User.create(name: "Bob", email: "email1", password: "password1")
    visit login_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password

    click_button "Submit"

    expect(current_path).to eq(root_path)

    click_link "Auth user page"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Hi!")
  end
  it "won't let unauth user see secret page" do
    # user1 = User.create(name: "Bob", email: "email1", password: "password1")
    visit root_path

    # fill_in "Email", with: user1.email
    # fill_in "Password", with: "bad_password"
    #
    # click_button "Submit"

    # expect(current_path).to eq(root_path)

    click_link "Auth user page"

    # expect(current_path).to eq(users_path)
    expect(page).to have_content("Hi!")
  end
end
