# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create a school User
School.create!(
            email: "school@test.com",
            password: "12345678",
            school_name: "Park Valley High School",
            address: "968 Grosvenor Pl, Oakland, CA 94610",
            contact_phone: "4155555555"
            )


Teacher.create!(
            email: "teacher@test.com",
            password: "12345678",
            first_name: "Bradley",
            last_name: "Johnson",
            phone_number: "6514913616",
            age: "29",
            gender: "Male",
            credentials: "B.A. Environmental Studies",
            min_grade: 0,
            max_grade: 12
)

Teacher.create!(
            email: "casey@test.com",
            password: "12345678",
            first_name: "Casey",
            last_name: "Shultz",
            phone_number: "6514913616",
            age: "31",
            gender: "Female",
            credentials: "B.A. Badass Studies",
            min_grade: 0,
            max_grade: 12
)

Teacher.create!(
            email: "bob@test.com",
            password: "12345678",
            first_name: "Bob",
            last_name: "Johnson",
            phone_number: "6514913616",
            age: "45",
            gender: "Male",
            credentials: "PhD. Obscure German Literature",
            min_grade: 0,
            max_grade: 12
)
