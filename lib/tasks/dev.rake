namespace :dev do
  desc "Cria dados fakes"
  task setup: :environment do
    # 100.times do |i|
    #   Product.create!(
    #     title: Faker::Commerce.product_name,
    #     description: Faker::ChuckNorris.fact,
    #     active: Faker::Boolean.boolean(true_ratio: 0.2),
    #     price: Faker::Commerce.price
    #   )
    # end
    # puts "criei alguns produtos"

    10.times do |i| 
      Category.create!(
        name: Faker::Commerce.department,
        # parent: Faker::Number.between(from: 1, to: 10)
      )
    end
  end

end
