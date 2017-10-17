# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Inventory.create(qty:1000, supply_list_id:1, clinic_id:1)
# ActualRecipeReq.create(qty:6, surgery_appt_id:1, supply_list_id:1)

# User.create()

Clinic.create(clinic_name: "JJ Watts' Orthopedic Surgeon")

# Low Movement
SupplyList.create(item_name: 'Knee-Replacement')
SupplyList.create(item_name: 'Hip-Replacement')
SupplyList.create(item_name: 'Rotator-Cuff-Replacement')
SupplyList.create(item_name: 'Shoulder-Cap-Replacement')
SupplyList.create(item_name: 'Ankle-Replacement')

# Low Movement
Inventory.create(qty: 200, clinic_id: 1, supply_list_id: 1 )
Inventory.create(qty: 200, clinic_id: 1, supply_list_id: 2 )
Inventory.create(qty: 200, clinic_id: 1, supply_list_id: 3 )
Inventory.create(qty: 200, clinic_id: 1, supply_list_id: 4 )
Inventory.create(qty: 200, clinic_id: 1, supply_list_id: 5 )

#High Movement
# starts at 6
SupplyList.create(item_name: 'Sutures-Absorbable')
SupplyList.create(item_name: 'Sutures-Non-Absorbable')
SupplyList.create(item_name: 'Orthopedic-Nail')
SupplyList.create(item_name: 'Gowns')

#High Movement
Inventory.create(qty: 1000, clinic_id: 1, supply_list_id: 6 )
Inventory.create(qty: 1000, clinic_id: 1, supply_list_id: 7 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 8 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 9 )


#Surgery Type Seeds
SurgeryType.create(surgery_name: "Tibial-Fracture-Repair")
SurgeryType.create(surgery_name: "Hip-Replacement")
SurgeryType.create(surgery_name: "Rotator-Cuff-Replacement")
SurgeryType.create(surgery_name: "Shoulder-Cap-Replacement")
SurgeryType.create(surgery_name: "Ankle-Replacement")

SurgeryRecipeReq.create(qty:2, supply_list_id:1, surgery_type_id:1)
SurgeryRecipeReq.create(qty:15, supply_list_id:6, surgery_type_id:1)
SurgeryRecipeReq.create(qty: 15, supply_list_id:7, surgery_type_id:1)
SurgeryRecipeReq.create(qty:5, supply_list_id:9, surgery_type_id:1)
SurgeryRecipeReq.create(qty:4, supply_list_id:8, surgery_type_id:1)

SurgeryRecipeReq.create(qty:1, supply_list_id:2, surgery_type_id:2)
SurgeryRecipeReq.create(qty:20, supply_list_id:6, surgery_type_id:2)
SurgeryRecipeReq.create(qty: 20, supply_list_id:7, surgery_type_id:2)
SurgeryRecipeReq.create(qty:5, supply_list_id:9, surgery_type_id:2)
SurgeryRecipeReq.create(qty:4, supply_list_id:8, surgery_type_id:2)

SurgeryRecipeReq.create(qty:2, supply_list_id:3, surgery_type_id:3)
SurgeryRecipeReq.create(qty:15, supply_list_id:6, surgery_type_id:3)
SurgeryRecipeReq.create(qty: 15, supply_list_id:7, surgery_type_id:3)
SurgeryRecipeReq.create(qty:5, supply_list_id:9, surgery_type_id:3)
SurgeryRecipeReq.create(qty:4, supply_list_id:8, surgery_type_id:3)

SurgeryRecipeReq.create(qty:2, supply_list_id:4, surgery_type_id:4)
SurgeryRecipeReq.create(qty:15, supply_list_id:6, surgery_type_id:4)
SurgeryRecipeReq.create(qty: 15, supply_list_id:7, surgery_type_id:4)
SurgeryRecipeReq.create(qty:5, supply_list_id:9, surgery_type_id:4)
SurgeryRecipeReq.create(qty:4, supply_list_id:8, surgery_type_id:4)

SurgeryRecipeReq.create(qty:2, supply_list_id:5, surgery_type_id:5)
SurgeryRecipeReq.create(qty:15, supply_list_id:6, surgery_type_id:5)
SurgeryRecipeReq.create(qty: 15, supply_list_id:7, surgery_type_id:5)
SurgeryRecipeReq.create(qty:5, supply_list_id:9, surgery_type_id:5)
SurgeryRecipeReq.create(qty:4, supply_list_id:8, surgery_type_id:5)

SurgeryRecipeReq.create(qty:2, supply_list_id:6, surgery_type_id:6)
SurgeryRecipeReq.create(qty:15, supply_list_id:6, surgery_type_id:6)
SurgeryRecipeReq.create(qty: 15, supply_list_id:7, surgery_type_id:6)
SurgeryRecipeReq.create(qty:5, supply_list_id:9, surgery_type_id:6)
SurgeryRecipeReq.create(qty:4, supply_list_id:8, surgery_type_id:6)


# l=0
# 25.times do
#   s+=1
#   # s+=1
#   5.times do
#     SurgeryAppt.create(surgery_date: "2017-10-#{l}", clinic_id:1, surgery_type_id: "#{rand(1..5)}")
#   end
# end
#


i = 0
25.times do
  i +=1
  3.times do
  SurgeryAppt.create(surgery_date: "2017-11-#{i}", clinic_id:1, surgery_type_id: "#{rand(1..5)}")
  end
end


s = 0
25.times do
  s +=1
  4.times do
  SurgeryAppt.create(surgery_date: "2017-10-#{s}", clinic_id:1, surgery_type_id: "#{rand(1..5)}")
  end
end

SurgeryAppt.all.where('surgery_date < ?', Date.yesterday).each do |close|
  close.update(complete:true)
end






# year, month, day = 2017, 10, nil
# dates = 5.times.map do
#   5.times.map do
#     Time.new(year, month, rand(1..31))
#   end.sort
# end
# dates.each do |group|
#   group.each do |date|
#     SurgeryAppt.create(surgery_date: date, clinic_id: 1, surgery_type_id: rand(1..5))
#   end
# end














# 5.times do |i|
#   i+=1
#   SurgeryRecipeReq.create(qty:4, supply_list_id:1, surgery_type_id:i)
#   SurgeryRecipeReq.create(qty:100, supply_list_id:2, surgery_type_id:i)
#   SurgeryRecipeReq.create(qty:50, supply_list_id:3, surgery_type_id:i)
#   SurgeryRecipeReq.create(qty:10, supply_list_id:4, surgery_type_id:i)
#   SurgeryRecipeReq.create(qty:10, supply_list_id:5, surgery_type_id:i)
#   SurgeryRecipeReq.create(qty:10, supply_list_id:6, surgery_type_id:i)
# end


# s=0
# 10.times do
#   s+=1
#   SurgeryAppt.create(surgery_date: "2017-10-14", clinic_id:1, surgery_type_id: s)
# end



# i=0
# 5.times do |i|
#   i+=1
#   ActualRecipeReq.create(qty:6, supply_list_id:1, surgery_appt_id:i)
#   ActualRecipeReq.create(qty:150, supply_list_id:2, surgery_appt_id:i)
#   ActualRecipeReq.create(qty:80, supply_list_id:3, surgery_appt_id:i)
#   ActualRecipeReq.create(qty:25, supply_list_id:4, surgery_appt_id:i)
#   ActualRecipeReq.create(qty:8, supply_list_id:5, surgery_appt_id:i)
#   ActualRecipeReq.create(qty:4, supply_list_id:6, surgery_appt_id:i)
# end






# SupplyList.create(qty: 100, clinic_id: 1,supply_list_id: i )
# SupplyList.create(qty: 100, clinic_id: 1,supply_list_id: i )
# SupplyList.create(qty: 100, clinic_id: 1,supply_list_id: i )
# SupplyList.create(qty: 100, clinic_id: 1,supply_list_id: i )
# SupplyList.create(qty: 100, clinic_id: 1,supply_list_id: i )



# SupplyList.create(item_name: 'Femoral Nail')
# SupplyList.create(item_name: 'Hip Screws')
# SupplyList.create(item_name: 'Ankle Screws')
# SupplyList.create(item_name: 'Ankle Screws')
# SupplyList.create(item_name: 'Shoulder Screws')
# SupplyList.create(item_name: 'Knee Screws')
# SupplyList.create(item_name: 'Ankle Screws')
# SupplyList.create(item_name: 'IV-set')
# SupplyList.create(item_name: 'Stryker-Pad')
# SupplyList.create(item_name: 'Gown')
# SupplyList.create(item_name: 'Oxygen-tubing')
# SupplyList.create(item_name: 'Suction-tubing')
# SupplyList.create(item_name: 'Bite-block')
# SupplyList.create(item_name: 'Biopsy-forceps')
# SupplyList.create(item_name: 'Brush')
# SupplyList.create(item_name: 'Scalpel')
