# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end
puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    topic_id: Topic.last.id
  )
end
puts "10 blog created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
    
  )
end
puts "5 skills created"

# 8.times do |portfolio_item|
#   Portfolio.create!(
#     title: "Portfolio title #{portfolio_item}",
#     subtitle: "My great project",
#     body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
#     main_image: "http://via.placeholder.com/600x400",
#     thumb_image: "http://via.placeholder.com/350x200"
#   )
# end
# 1.times do |portfolio_item|
#   Portfolio.create!(
#     title: "Portfolio title #{portfolio_item}",
#     subtitle: "Angular",
#     body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
#     main_image: "http://via.placeholder.com/600x400",
#     thumb_image: "http://via.placeholder.com/350x200"
#   )
# end
# puts "9 portfolio items created"

# 3.times do |technology|
#   # Technology.create!(
#   #   name: "Technology #{technology}"
#   #   portfolio_id: 3
#   # )
#   Portfolio.third.technologies.create!(
#     name: "Technology #{technology}"
#   )
# end
# puts "3 technologies items created"
