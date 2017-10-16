# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Inventory.create(qty:1000, supply_list_id:1, clinic_id:1)
# ActualRecipeReq.create(qty:6, surgery_appt_id:1, supply_list_id:1)


SupplyList.create(item_name: 'IV-set')
SupplyList.create(item_name: 'Stryker-Pad')
SupplyList.create(item_name: 'Gown')
SupplyList.create(item_name: 'Oxygen-tubing')
SupplyList.create(item_name: 'Suction-tubing')
SupplyList.create(item_name: 'Bite-block')
SupplyList.create(item_name: 'Biopsy-forceps')
SupplyList.create(item_name: 'Brush')
SupplyList.create(item_name: 'Gloves')


Clinic.create(clinic_name: "South Miami Gastro")

Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 1 )
Inventory.create(qty: 1000, clinic_id: 1, supply_list_id: 2 )
Inventory.create(qty: 1000, clinic_id: 1, supply_list_id: 3 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 4 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 5 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 6 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 7 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 8 )
Inventory.create(qty: 500, clinic_id: 1, supply_list_id: 9 )


SurgeryType.create(surgery_name: "Endoscopy")
SurgeryType.create(surgery_name: "Colonoscopy")
SurgeryType.create(surgery_name: "Enteroscopy")
SurgeryType.create(surgery_name: "Upper-Endoscopy")
SurgeryType.create(surgery_name: "Ostomy-Exam")


5.times do |i|
  i+=1
  SurgeryRecipeReq.create(qty:4, supply_list_id:1, surgery_type_id:i)
  SurgeryRecipeReq.create(qty:100, supply_list_id:2, surgery_type_id:i)
  SurgeryRecipeReq.create(qty:50, supply_list_id:3, surgery_type_id:i)
  SurgeryRecipeReq.create(qty:10, supply_list_id:4, surgery_type_id:i)
  SurgeryRecipeReq.create(qty:10, supply_list_id:5, surgery_type_id:i)
  SurgeryRecipeReq.create(qty:10, supply_list_id:6, surgery_type_id:i)
end


# s=0
# 10.times do
#   s+=1
#   SurgeryAppt.create(surgery_date: "2017-10-14", clinic_id:1, surgery_type_id: s)
# end

s=0
l=14
25.times do
  l+=1
  # s+=1
  5.times do
    SurgeryAppt.create(surgery_date: "2017-10-#{l}", clinic_id:1, surgery_type_id: "#{rand(1..4)}")
  end
  # puts "#{s} appointments created"
end


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
