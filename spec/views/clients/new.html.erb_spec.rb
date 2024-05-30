require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      nome: "MyString",
      sobrenome: "MyString",
      endereco: "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[nome]"

      assert_select "input[name=?]", "client[sobrenome]"

      assert_select "input[name=?]", "client[endereco]"
    end
  end
end
