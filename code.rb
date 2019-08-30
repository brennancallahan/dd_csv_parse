require 'csv'
require 'pry'
require_relative 'site.rb'
require_relative 'person.rb'

sites = []
people = []
prepared_site_data = []
prepared_people_data = []

# holds all site numbers to check for duplicates before creating a new one
site_numbers = []
# holds all personal id numbers to check for duplicates before creating a new one
id_numbers = []

data = CSV.read('source.csv', headers: true)
data.each do |row|

    # site data
    country = row["Country"]
    site_number = row["Site Number"].to_i
    facility_name = row["Facility Name"]
    address = row["Site Address"]
    city = row["Site City"]
    state = row["Site State/County"]
    zip = row["Site Zip"]

    # person data
    first_name = row["Person First Name"]
    middle_name = row["Person Middle Name"]
    last_name = row["Person Surname"]
    roles = row["Person Role"]
    id_number = row["Person Number"].to_i
    email = row["Person Email"]
    telephone = row["Person Telephone"]

    # prevents duplicate instances of a site from being created
    if site_number && !site_numbers.include?(site_number)
        site_numbers << site_number
        new_site = Site.new(country, site_number, facility_name, address, city, state, zip)
        sites << new_site
    end
    
    # prevents duplicate instances of a person from being created
    if id_number && !id_numbers.include?(id_number)
        id_numbers << id_number
        new_person = Person.new(first_name, middle_name, last_name, roles, id_number, email, telephone)
        people << new_person
    else
        # used to account for one person having multiple roles
        a = id_numbers.find_index(id_number)
        people[a].add_role(roles)
    end
    
end

i = 0
while i < sites.length do
    puts "POST /sites\n    number: #{sites[i].site_number}\n    facility_name: #{sites[i].facility_name}\n    country: #{sites[i].country}\n    address: #{sites[i].address}\n\n"
    i+= 1
end

a = 0
while a < people.length do
    puts "POST /person\n   external_identifier: #{people[a].id_number}\n   email: #{people[a].email}\n   first_name: #{people[a].first_name}\n   last_name: #{people[a].last_name}\n   roles: #{people[a].roles.join(", ")}\n\n"
    a += 1
end

















# sites.each do |site|
#     site_data = {
#         site_number: site.site_number,
#         facility_name: site.facility_name,
#         country: site.country,
#         address: site.address
#     }
#     prepared_site_data << site_data
# end

# people.each do |person|
#     person_data = {
#         external_identifier: person.id_number,
#         email: person.email,
#         first_name: person.first_name,
#         last_name: person.last_name,
#         roles: person.role
#     }
#     prepared_people_data << person_data
# end
