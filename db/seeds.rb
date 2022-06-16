

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
    WeightDatum.create(id_device:10, 
                       outlet_name: "L1", 
                       weight: rand(0.000..300.000) , 
                       unit: "0", 
                       )
  end
10.times do |i|
    WeightDatum.create(id_device:10, 
                       outlet_name: "R2", 
                       weight: rand(0.000..300.000) , 
                       unit: "0", 
                       )
  end
10.times do |i|
    WeightDatum.create(id_device:10, 
                       outlet_name: "R3", 
                       weight: rand(0.000..300.000) , 
                       unit: "0", 
                       )
  end
10.times do |i|
    WeightDatum.create(id_device:10, 
                       outlet_name: "R4", 
                       weight: rand(0.000..300.000) , 
                       unit: "0", 
                       )
  end
10.times do |i|
    WeightDatum.create(id_device:10, 
                       outlet_name: "R5", 
                       weight: rand(0.000..300.000) , 
                       unit: "0", 
                       )
  end
  10.times do |i|
    WeightDatum.create(id_device:10, 
                       outlet_name: "AT", 
                       weight: rand(0.000..300.000) , 
                       unit: "0", 
                       )
  end