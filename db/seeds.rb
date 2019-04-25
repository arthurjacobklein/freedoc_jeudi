# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# destroy all before new creation
Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Appointment.destroy_all
#Specialty.destroy_all
puts "Destroy the previous database"

#Fake cities creation
	10.times do
	 city = City.new
	 city.name = Faker::Address.city
	 city.save
    end
puts "You've created 10 cities"

# Fake doctors creation
50.times do
  doctor = Doctor.new
  doctor.first_name = Faker::Name.first_name
  doctor.last_name = Faker::Name.last_name
  doctor.zip_code = Faker::Address.zip_code
  #doctor.specialty = Faker::Job.title
  doctor.city_id = rand((City.first.id)..(City.last.id))
  doctor.save
end
puts "You've created 50 fake doctors"


# Fake patients creation
100.times do
  patient = Patient.new
  patient.first_name = Faker::Name.first_name
  patient.last_name = Faker::Name.last_name
  patient.city_id = rand((City.first.id)..(City.last.id))
  patient.save
end
puts "You've created 100 fake patients"

# Fake appointments creation
200.times do
  appointment = Appointment.new
  appointment.date = Faker::Date.forward
  appointment.doctor_id = rand((Doctor.first.id)..(Doctor.last.id))
  appointment.patient_id = rand((Patient.first.id)..(Patient.last.id))
  appointment.city_id = rand((City.first.id)..(City.last.id))
  appointment.save
end
puts "You've created 200 fake appointments!"

# Specialties creation
10.times do 
  specialty = Specialty.new
  specialty.name = ["Invasive Cardiology", "Orthopedic Surgery", "Gastroenterology", "Urology", "Dermatology", "Anesthesiology", "Plastic Surgery", "Radiology", "Emergency Medicine", "General Surgery"].sample 
  specialty.save
end

100.times do
  doctor_speciality = DoctorSpeciality.create!(specialty_id: Specialty.all.sample.id, doctor_id: Doctor.all.sample.id)
end

puts "You've created 10 specialities"