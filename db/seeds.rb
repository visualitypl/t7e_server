# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Language.create!(
            name: 'English',
            iso_code: 'en'
)
Language.create!(
    name: 'Polish',
    iso_code: 'pl'
)
Language.create!(
    name: 'Turkish',
    iso_code: 'tr'
)
