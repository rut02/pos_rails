# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
ProductCategory.find_or_create_by!(name: "Food")
ProductCategory.find_or_create_by!(name: "Drink")
ProductCategory.find_or_create_by!(name: "Snack")

Product.find_or_create_by!(name: "Burger", product_category_id: 1, description: "Tasty", unit_price: 10)
Product.find_or_create_by!(name: "Fries", product_category_id: 1, description: "Tasty", unit_price: 5)
Product.find_or_create_by!(name: "Coke", product_category_id: 2, description: "Tasty", unit_price: 5)
Product.find_or_create_by!(name: "Ice Cream", product_category_id: 3, description: "Tasty", unit_price: 5)
Product.find_or_create_by!(name: "Pizza", product_category_id: 1, description: "Tasty", unit_price: 15)
Product.find_or_create_by!(name: "Pasta", product_category_id: 1, description: "Tasty", unit_price: 12)
Product.find_or_create_by!(name: "Salad", product_category_id: 1, description: "Tasty", unit_price: 8)
Product.find_or_create_by!(name: "Tea", product_category_id: 2, description: "Tasty", unit_price: 3)
Product.find_or_create_by!(name: "Coffee", product_category_id: 2, description: "Tasty", unit_price: 4)
Product.find_or_create_by!(name: "Sandwich", product_category_id: 1, description: "Tasty", unit_price: 6)

StatusMaster.find_or_create_by!(name: "Pending")#1
StatusMaster.find_or_create_by!(name: "Completed")#2
StatusMaster.find_or_create_by!(name: "Cancelled")#3

StatusMaster.find_or_create_by!(name: "Cooking")#4
StatusMaster.find_or_create_by!(name: "Served") #5

StatusMaster.find_or_create_by!(name: "Paid") #6
StatusMaster.find_or_create_by!(name: "Available") #7
StatusMaster.find_or_create_by!(name: "Unavailable") #8
StatusMaster.find_or_create_by!(name: "Reserved") #9
StatusMaster.find_or_create_by!(name: "Opened") #10

Table.find_or_create_by!(name: "Table 1", capacity: 4, status_master_id: 7)
Table.find_or_create_by!(name: "Table 2", capacity: 6, status_master_id: 7)
Table.find_or_create_by!(name: "Table 3", capacity: 8, status_master_id: 7)
Table.find_or_create_by!(name: "Table 4", capacity: 10, status_master_id: 7)
Table.find_or_create_by!(name: "Table 5", capacity: 12, status_master_id: 8)

Staff.find_or_create_by!(name: "Chef")
Staff.find_or_create_by!(name: "Waiter")

Gender.find_or_create_by!(gender: "Male")
Gender.find_or_create_by!(gender: "Female")

AgeRange.find_or_create_by!(age_range: "0-18")
AgeRange.find_or_create_by!(age_range: "19-35")
AgeRange.find_or_create_by!(age_range: "35+")

# Staff.create!([
#   { name: 'burapha' },
#   { name: 'pan' },
#   { name: 'top' }
# ])


# StatusMaster.create!([
#   { name: 'available' },
#   { name: 'reserved' },
#   { name: 'maintenance' },
#   { name: 'open' },
#   { name: 'close' },
#   { name: 'pending' },
#   { name: 'preparing' },
#   { name: 'finish' },
#   { name: 'cancel' },
#   { name: 'activate' },
#   { name: 'expired' }
# ])

# Gender.create!([
#   { gender: 'male' },
#   { gender: 'female' },
# ])


# AgeRange.create!([
#   { age_range: '0-18' },
#   { age_range: '19-35' },
#   { age_range: '35+' }
# ])


# ProductCategory.create!([
#   { name: 'food' },
#   { name: 'beverage' },
#   { name: 'snack' }
  
# ])


# Product.create!([
#   { name: 'Pepsi', product_category_id: 1, description: 'soft drink', unit_price: 4.99},
#   { name: 'Coca Cola', product_category_id: 1, description: 'soft drink', unit_price: 4.99},
#   { name: 'Sprite', product_category_id: 1, description: 'soft drink', unit_price: 4.99},
#   { name: 'Water', product_category_id: 1, description: 'soft drink', unit_price: 9.99},
#   { name: 'T-bone Steak', product_category_id: 2, description: 'food', unit_price: 14.99 },
#   { name: 'Omelet', product_category_id: 2, description: 'food', unit_price: 17.99 },
#   { name: 'Egg with Toast', product_category_id: 2, description: 'food', unit_price: 12.99 },
#   { name: 'Cheese Wrap', product_category_id: 2, description: 'food', unit_price: 12.99 },
#   { name: 'Pancakes', product_category_id: 2, description: 'food', unit_price: 19.99 },
#   { name: 'Sandesh', product_category_id: 3, description: 'snack', unit_price: 4.99 },
#   { name: 'Tanghulu', product_category_id: 3, description: 'snack', unit_price: 9.99 },
#   { name: 'Toffee', product_category_id: 3, description: 'snack', unit_price: 14.99 }
# ])

# Table.create!([
#   { name: 'table_1', status_master_id: 1 },
#   { name: 'table_2', status_master_id: 2 },
#   { name: 'table_3', status_master_id: 3 }
# ])


# Reservation.create!([
#   { staff_id: 1, table_id: 1, customer_name: 'Meow', reservation_date: '2024-12-15 18:30:00' ,status_master_id: 2},
#   { staff_id: 2, table_id: 2, customer_name: 'Ribegas', reservation_date: '2024-12-16 19:00:00', status_master_id: 2 }
# ])

# Member.create!([
#   { cid: 700012314, name: 'kanomtom', expired: DateTime.now + 1.year, status_master_id: 1 },
#   { cid: 703213213, name: 'chatchat', expired: DateTime.now + 1.year, status_master_id: 1 }
# ])



# Bill.create!([
#   { doc_no: 'B20231201', doc_date: Date.today, total_price: 100.0, total_amount: 5, discount: 10.0, get_paid: 90.0, change: 0.0,customer_name:'kanomtom',table_id:2, member_id: 1, reservation_id: 1, status_master_id: 1 },
#   { doc_no: 'B41221232', doc_date: Date.today, total_price: 300.0, total_amount: 5, discount: 0.0, get_paid: 500.0, change: 200.0,customer_name:'blue',table_id:3, member_id: nil, reservation_id: nil, status_master_id: 1 },
#   { doc_no: 'B20231202', doc_date: Date.today, total_price: 50.0, total_amount: 2, discount: 5.0, get_paid: 45.0, change: 0.0, customer_name:'nay',table_id:2, member_id: nil, reservation_id: nil, status_master_id: 2 },
#   { doc_no: 'B20231204', doc_date: 7.days.ago, total_price: 150.0, total_amount: 3, discount: 15.0, get_paid: 135.0, change: 0.0,customer_name:'rotee',table_id:2, member_id: 1, reservation_id: 1, status_master_id: 3 },
#   { doc_no: 'B41221111', doc_date: 7.days.ago, total_price: 500.0, total_amount: 5, discount: 0.0, get_paid: 500.0, change: 0.0,customer_name:'blue',table_id:3, member_id: 1, reservation_id: nil, status_master_id: 1 },
#   { doc_no: 'B41222221', doc_date: 7.days.ago, total_price: 600.0, total_amount: 5, discount: 0.0, get_paid: 600.0, change: 0.0,customer_name:'ann',table_id:3, member_id: 1, reservation_id: nil, status_master_id: 1 },
#   { doc_no: 'B41222343', doc_date: 7.days.ago, total_price: 600.0, total_amount: 5, discount: 0.0, get_paid: 600.0, change: 0.0,customer_name:'ann',table_id:3, member_id: 1, reservation_id: nil, status_master_id: 1 },
#   { doc_no: 'B20231126', doc_date: 15.days.ago, total_price: 200.0, total_amount: 6, discount: 20.0, get_paid: 180.0, change: 0.0,customer_name:'kanomtom', table_id:2,member_id: 2, reservation_id: 2, status_master_id: 4 },
#   { doc_no: 'B20231111', doc_date: 1.month.ago, total_price: 250.0, total_amount: 7, discount: 0.0, get_paid: 250.0, change: 0.0,customer_name:'ann',table_id:2, member_id: 1, reservation_id: 2, status_master_id: 5 },
#   { doc_no: 'B20230911', doc_date: 3.months.ago, total_price: 300.0, total_amount: 10, discount: 30.0, get_paid: 270.0, change: 0.0,customer_name:'kanomtom',table_id:2, member_id: 2, reservation_id: 2, status_master_id: 6 },
#   { doc_no: 'B20231211', doc_date: 1.year.ago, total_price: 400.0, total_amount: 12, discount: 40.0, get_paid: 360.0, change: 0.0,customer_name:'kanomtom',table_id:2, member_id: 1, reservation_id: 1, status_master_id: 7 }
# ])


# GenderBill.create!([
#   { bill_id: 1, gender_id: 1, amount: 2 },
#   { bill_id: 1, gender_id: 2, amount: 3 },
#   { bill_id: 2, gender_id: 1, amount: 1 },
#   { bill_id: 2, gender_id: 2, amount: 1 }
# ])

# AgeRangeBill.create!([
#   { bill_id: 1, age_range_id: 3, amount: 2 },
#   { bill_id: 1, age_range_id: 2, amount: 3 },
#   { bill_id: 2, age_range_id: 2, amount: 1 },
#   { bill_id: 2, age_range_id: 3, amount: 1 }
# ])

# Order.create!([
#   { bill_id: 1, doc_no: 'O20231201', doc_date: '2024-12-01 12:10:00', total_price: 100.0, total_amount: 5, staff_id: 1, status_master_id: 1 },
#   { bill_id: 2, doc_no: 'O20231202', doc_date: '2024-12-02 13:10:00', total_price: 50.0, total_amount: 2, staff_id: 2, status_master_id: 2 }
# ])

# OrderItem.create!([
#   { order_id: 1, product_id: 1, amount: 2, unit_price: 1.5, price: 3.0 },
#   { order_id: 1, product_id: 3, amount: 3, unit_price: 8.5, price: 25.5 },
#   { order_id: 2, product_id: 2, amount: 2, unit_price: 2.0, price: 4.0 }
# ])