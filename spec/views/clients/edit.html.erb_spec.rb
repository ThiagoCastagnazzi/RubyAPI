require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  let(:client) {
    Client.create!(
      nome: "MyString",
      sobrenome: "MyString",
      endereco: "MyString"
    )
  }

  before(:each) do
    assign(:client, client)
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(client), "post" do

      assert_select "input[name=?]", "client[nome]"

      assert_select "input[name=?]", "client[sobrenome]"

      assert_select "input[name=?]", "client[endereco]"
    end
  end
end
