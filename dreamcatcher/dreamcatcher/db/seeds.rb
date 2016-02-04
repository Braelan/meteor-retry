# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

User.create([
   {name: 'Braelan', password_digest: 'test', session_token: 'test', email: 'test.gmail.com'},
   {name: 'Adrian', status: 'mentor', password_digest: 'test', session_token: 'test', uid: 'test'},
   {name: 'Jessica', password_digest: 'test', session_token: 'test', provider: 'twitter'},
   {name: 'Jeffrey', password_digest: 'test', session_token: 'test', image_url: 'image.com/image'}
   ])
#

Post.create([{ user_id: 1, front: 'Rastafarian Greetings', back: 'save the cetacians'},
            { user_id: 2, front: 'Narwhals need Protection', back: 'UNITE'},
            { user_id: 3, front: 'Copenhaggen', back: 'Meatballs'},


  ])
 # can create a post with many recipients.  When it is created, multiple recipient
 # objects are also created
Recipient.create([{post_id: 1, user_id:1},
                  {post_id: 2, user_id: 2},
                  {post_id: 3, user_id: 3},
                  {post_id: 3, user_id: 4}
  ])
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
