# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create a school User
School.create(
            email: "school@test.com",
            password: "12345678",
            school_name: "Park Valley High School",
            address: "968 Grosvenor Pl, Oakland, CA 94610",
            contact_phone: "4155555555"
            )
