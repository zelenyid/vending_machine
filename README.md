# vending_machine

The vending machine, once a product is selected and the appropriate amount of money (coins) is inserted, returns that product. It return change (coins) if too much money is provided or ask for more money (coins) if there is not enough.

To run the project, please, run next commands:
```
1. git clone https://github.com/zelenyid/vending_machine.git
2. cd vending_machine
3. bundle install
3. rake db:create
4. ruby db/seed.rb
5. ruby application.rb
```

To setup staff of the vending machine you need to change db/seed.rb and if you want to add new Product or Money denomination use:
```
Product.new(<product_name>, <product_price>, <quantity_of_products>)
Money.new(<demonination>, <quantity_of_demonination>)
```
Validation:
```
product_name - not empty string ("pepsi", "sprite" etc.)
product_price - positive number (5, 10, 13, 2.50 etc.)
quantity_of_products - positive_integer (1, 2, 3 etc.)
demonination - not empty string ("5", "2", "0.25" etc.)
quantity_of_demonination - positive_integer (1, 2, 3 etc.)
```

Work in the program looks like:
![Screenshot from 2021-09-27 09-42-42](https://user-images.githubusercontent.com/24934142/134857488-3a5dc902-7d00-4088-8d00-9f724c8bf457.png)
