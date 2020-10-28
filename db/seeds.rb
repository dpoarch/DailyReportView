# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

locationtypes = ['Distribution Center','Fulfillment Center']

locationtypes.each do |location_description|
    locationtype = LocationType.find_or_initialize_by(description:location_description)
    locationtype.save!
end

orderstatuses = ['Not Fulfilled','Fulfilled ']
orderstatuses.each do |orderstatuses_description|
    orderstatus = OrderStatus.find_or_initialize_by(description:orderstatuses_description)
    orderstatus.save!
end

 pictures = ["Abstract-Background-1209738970.jpg", "Autumn-lifestyle-1066694406.jpg", "Free-Photo-Oct19-1268636389_740x492.jpg", "Halloween-1144979907.jpg", "IQ-Blog-478145302_740x492.jpg", "RF-813062534_740x492.jpg" ]
productslist =['Burlap Bouquet', 'Peonies', 'The Minimalist', 'Jawbreaker', 'Reset Button']
productslist.each do |product_name|
    product = Product.find_or_initialize_by(name:product_name)
    product.description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4) ;
    product.code = Faker::Commerce.promotion_code;
    product.sku = Faker::Barcode.ean_with_composite_symbology(13);
    product.price = Faker::Commerce.price;
    product.quantity = rand(10000..100000);
    product.uom = 'pcs';
    # product.image = 'images/'+pictures[rand(pictures.length)];
     pictureName = pictures[rand(pictures.length)];
     product.image.attach(
        io: File.open('app/assets/images/'+pictureName),
        filename: pictureName
    )
    product.save;
end

locationcenters = [
    ['Sun Valley','Distribution Center'],
    ['Green Valley','Distribution Center'],
    ['Agrogana','Distribution Center'],
    ['Watsonville','Fulfillment Center']
]

locationcenters.each do |location_name,location_type|
    location = Location.find_or_initialize_by(description:location_name)
    # address = Address.create(
    #     "street"=>Faker::Address.street_address,
    #     "city"=>Faker::Address.street_address,
    #     "state"=>Faker::Address.street_address,
    #     "country"=>Faker::Address.street_address,
    #     "delivery_address"=> false,
    #     "billing_address"=> false,
    #     "postcode"=>Faker::Address.postcode
    # );
    # location.address = address;
    location.address = Faker::Address.full_address ;

    locationtype = LocationType.where("description = :description", description:location_type).first;
    location.location_type = locationtype;
      #t.references :address, null: false, foreign_key: true
      #t.references :location_type, null: false, foreign_key: true
    location.save

    if location_name=='Sun Valley'
        product = Product.where('name=:name',name:'Peonies').first;
        cost = rand(1..100);
        rand(2..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end

    end

    if location_name=='Green Valley'
        product = Product.where('name=:name',name:'Jawbreaker').first;
        cost = rand(1..100);
        rand(1..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end
    end


    if location_name=='Agrogana'
        product = Product.where('name=:name',name:'Jawbreaker').first;
        cost = rand(1..100);
        rand(1..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end

        product = Product.where('name=:name',name:'The Minimalist').first;
        cost = rand(1..100);
        rand(1..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end
    end

    if location_name=='Watsonville'

        product = Product.where('name=:name',name:'Peonies').first;
        cost = rand(1..100);
        rand(2..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end

        product = Product.where('name=:name',name:'Jawbreaker').first;
        cost = rand(1..100);
        rand(1..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end

        product = Product.where('name=:name',name:'The Minimalist').first;
        cost = rand(1..100);
        rand(1..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end

        product = Product.where('name=:name',name:'Burlap Bouquet').first;
        cost = rand(1..100);
        rand(2..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end

        product = Product.where('name=:name',name:'Reset Button').first;
        cost = rand(1..100);
        rand(2..5).times do
            quantity = rand(1000..10000);

            LocationInventory.create(
                "location"=>location,
                "product"=>product,
                "quantity"=>quantity,
                "quantity_available"=>quantity,
                "cost"=>cost,
                "selling_price"=>(cost+(cost*rand(0.001..0.1)))
            );
        end
    end

end


products_calc = LocationInventory
                        .select("location_id,product_id,sum(quantity_available) as quantity,sum(location_inventories.quantity_available*location_inventories.cost)/sum(location_inventories.quantity_available) as average_cost, sum(location_inventories.quantity_available*location_inventories.selling_price)/sum(location_inventories.quantity_available) as price")
                        .group('location_id,product_id');

products_calc.each do |inventory|

    product_info = Product.find(inventory.product_id);

    locationProduct = LocationProduct.where("location_id=:location_id and product_id=:product_id",location_id:inventory.location_id,product_id:inventory.product_id).first;

    if locationProduct.blank?
        locationProduct= LocationProduct.create(
            "location_id"=>inventory.location_id,
            "product_id"=>inventory.product_id,
            "quantity"=>inventory.quantity,
            "average_cost"=>inventory.average_cost,
            "price"=>inventory.price,
            "uom" => product_info.uom
        );


        Cart.create(
            "location_product" => locationProduct,
            "price" => locationProduct.price,
            "quantity_delivered" => 0,
            "sessionid" =>  Random.uuid(),
            "quantity" => 1
            )
    else
        locationProduct.location_id=inventory.location_id;
        locationProduct.product=product_info;
        locationProduct.quantity=inventory.quantity;
        locationProduct.average_cost=inventory.average_cost;
        locationProduct.price=inventory.price;
        locationProduct.uom=product_info.uom;
        locationProduct.save;
    end


end
