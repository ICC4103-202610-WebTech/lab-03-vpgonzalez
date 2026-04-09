# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting old data..."
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

puts "Creating owners..."

owner_1 = Owner.create(
    first_name: "Matias",
    last_name: "Ramirez",
    email: "matiasramirezalarconn@gmail.com",
    phone: "933157989",
    address: "pasaje san rodrigo 162"
)

owner_2 = Owner.create(
    first_name: "Valentina",
    last_name: "Gonzalez",
    email: "vpmgonzalezz@gmail.com",
    phone: "959848313",
    address: "Aranjuez sur 149"
)

owner_3 = Owner.create(
    first_name: "Myriam",
    last_name: "Torres",
    email: "myriamtoress@gmail.com",
    phone: "977796932",
    address: "los amerindios 543"
)

puts "Creating pets..."

pet_1 = owner_1.pets.create(
    name: "Rocco",
    species: "Dog",
    breed: "Akita",
    date_of_birth: Date.new(2018,9,23),
    weight: 45.7
)

pet_2 = owner_1.pets.create(
    name: "Milo",
    species: "Rabbit",
    breed: "Mini Lop",
    date_of_birth: Date.new(2024,5,12),
    weight: 15.7
)

pet_3 = owner_2.pets.create(
    name: "Peludito",
    species: "Dog",
    breed: "Pomerania",
    date_of_birth: Date.new(2022,8,23),
    weight: 20.4
)

pet_4 = owner_2.pets.create(
    name: "Luna",
    species: "Ferret",
    breed: "Silver",
    date_of_birth: Date.new(2015,12,24),
    weight: 8.9
)

pet_5 = owner_3.pets.create(
    name: "Benito",
    species: "Dog",
    breed: "Husky siberiano",
    date_of_birth: Date.new(2024,2,12),
    weight: 50.7
)

pet_6 = owner_3.pets.create(
    name: "Elvis",
    species: "Cat",
    breed: "Siames",
    date_of_birth: Date.new(2010,10,16),
    weight: 25.2
)

puts "Creating vets..."

vet_1 = Vet.create(
    first_name: "Monserrat",
    last_name: "Bravo",
    email: "monserratbravo@gmail.com",
    phone: "986872539",
    specialization: "Veterinarian"
)

vet_2 = Vet.create(
    first_name: "Josefina",
    last_name: "Medina",
    email: "josefinamedina@gmail.com",
    phone: "961877926",
    specialization: "Veterinary ultrasound specialist"
)

puts "Creating appointments..."

appointment_1 = Appointment.create(
    pet: pet_1,
    vet: vet_2,
    date: DateTime.new(2026, 4, 15, 10, 0, 0),
    reason: "Cross-ligament cut",
    status: 2
)

appointment_2 = Appointment.create(
    pet: pet_2,
    vet: vet_1,
    date: DateTime.new(2026, 4, 16, 11, 30, 0),
    reason: "Annual checkup",
    status: 1
)

appointment_3 = Appointment.create(
    pet: pet_3,
    vet: vet_2,
    date: DateTime.new(2026, 4, 19, 14, 0, 0),
    reason: "Leg injury",
    status: 2
)

appointment_4 = Appointment.create(
    pet: pet_4,
    vet: vet_1,
    date: DateTime.new(2026, 4, 13, 12, 0, 0),
    reason: "Vaccination",
    status: 3
)

appointment_5 = Appointment.create(
    pet: pet_5,
    vet: vet_2,
    date: DateTime.new(2026, 4, 19, 10, 0, 0),
    reason: "Pregnancy",
    status: 0
)

appointment_6 = Appointment.create(
    pet: pet_6,
    vet: vet_1,
    date: DateTime.new(2026, 4, 22, 9, 0, 0),
    reason: "Dental cleaning",
    status: 1
)

puts "Creating treatments..."

Treatment.create(
    appointment: appointment_1,
    name: "Knee surgery",
    medication: "Antibiotic",
    dosage: "One pill a day",
    notes: "Operation successfully completed.",
    administered_at: DateTime.new(2026, 4, 16, 12, 15, 0)
)

Treatment.create(
    appointment: appointment_2,
    name: "Annual review",
    medication: "Melatonin",
    dosage: "Half a pill every 12 hours",
    notes: "Complications are visualised in sleep.",
    administered_at: DateTime.new(2026, 4, 16, 12, 0, 0)
)

Treatment.create(
    appointment: appointment_3,
    name: "Leg injury",
    medication: "Antibiotic cream",
    dosage: "Apply twice daily",
    notes: "Treatment started during the visit.",
    administered_at: DateTime.new(2026, 4, 17, 12, 15, 0)
)

Treatment.create(
    appointment: appointment_6,
    name: "Dental cleaning",
    medication: "None",
    dosage: "N/A",
    notes: "Procedure in process",
    administered_at: DateTime.new(2026, 4, 17, 9, 30, 0)
)

Treatment.create(
    appointment: appointment_1,
    name: "Bandage placement",
    medication: "Topical antiseptic",
    dosage: "Apply before bandaging",
    notes: "Front leg was stabilized",
    administered_at: DateTime.new(2026, 4, 19, 14, 30, 0)
)

puts "Seed data created successfully!"