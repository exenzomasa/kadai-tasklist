# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..14).each do |number|
  if number < 10
    Task.create(content: 'Lesson ' + number.to_s, status: 'Done ')
  elsif number == 10
     Task.create(content: 'Lesson ' + number.to_s, status: 'WIP ')
  else
      Task.create(content: 'Lesson ' + number.to_s, status: 'New ')
  end
end