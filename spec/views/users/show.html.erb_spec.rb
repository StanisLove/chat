require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :crypted_password => "Crypted Password",
      :salt => "Salt",
      :username => "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Crypted Password/)
    expect(rendered).to match(/Salt/)
    expect(rendered).to match(/Username/)
  end
end
