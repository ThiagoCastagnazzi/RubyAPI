namespace :cad do 
    desc 'Criação de Produtos no banco de dados'
    task product: :environment do
        puts 'Cadastrando produto...'
        10.times do
            Product.create(
                name: Faker::Commerce.product_name,
                description: Faker::Commerce.product_name,
                price: Faker::Commerce.price(range: 10.0..100.00),
                category_id: 1,
            )
        end
        puts 'Produto cadastro com sucesso!'
    end
end