# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[1,2,3].each do |num|
  User.create(
    username:"user#{num}",
    email: "user#{num}@example.com",
    password: "test123"
  )
end

["Nature", "NYC", "Art", "Humor"].each do |tag_name|
  Tag.create(name: tag_name)
end

#CREATING PICTURES

url1 = "http://www.defenders.org/sites/default/files/styles/large/public/dolphin-kristian-sekulic-isp.jpg"

Picture.create(
  img_url: url1,
  title: "Saw a dolphin!",
  user_id: User.first.id
)

url2= "https://pbs.twimg.com/profile_images/1002272769352978433/9S4QWSR0_400x400.jpg"

Picture.create(
  img_url: url2,
  title: "Spongebob is bae!",
  user_id: User.last.id
)

#CREATING COMMENTS -- the last picture, the spongebob picture should have two comments by two separate users; the first picture should have one comment by another user.

 Comment.create(
  content: "nice teeth!",
  user_id: User.first.id,
  picture_id: Picture.last.id
)

Comment.create(
 content: "nice? they're GREAT teeth!",
 user_id: User.last.id,
 picture_id: Picture.last.id
)

Comment.create(
 content: "Check that out!",
 user_id: User.last.id,
 picture_id: Picture.first.id
)
#CREATING PICTURE TAGS -- the first picture should have two diff tags, both pictures should share a tag

PictureTag.create(
  picture_id: Picture.last.id,
  tag_id: Tag.first.id
)

PictureTag.create(
  picture_id: Picture.first.id,
  tag_id: Tag.first.id
)

PictureTag.create(
  picture_id: Picture.first.id,
  tag_id: Tag.last.id
)
