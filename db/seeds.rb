#require 'faker'
 
# Create Posts
#50.times do
#  Post.create!(
#    title:  Faker::Lorem.sentence,
#    body:   Faker::Lorem.paragraph
#  )
#end
#posts = Post.all

if !Post.exists?(title: "Unique Post 1")
  puts "Unique Post 1 not found"
  Post.create!(
    title:  "Unique Post 1",
    body:   "This is a description for Unique Post 1"
  )
else
  puts "Unique Post 1 exists already"
end
 
# Create Comments
#100.times do
#  Comment.create!(
#    post: posts.sample,
#    body: Faker::Lorem.paragraph
#  )
#end
 
#puts "Seed finished"
#puts "#{Post.count} posts created"
#puts "#{Comment.count} comments created"
