require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    assign(:client, Client.create!(
      nome: "Nome",
      sobrenome: "Sobrenome",
      endereco: "Endereco"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Sobrenome/)
    expect(rendered).to match(/Endereco/)
  end
end
