require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        nome: "Nome",
        sobrenome: "Sobrenome",
        endereco: "Endereco"
      ),
      Client.create!(
        nome: "Nome",
        sobrenome: "Sobrenome",
        endereco: "Endereco"
      )
    ])
  end

  it "renders a list of clients" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sobrenome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Endereco".to_s), count: 2
  end
end
