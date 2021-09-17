select * from world.country;

-- @block
insert into message_app.users
  (firstName, lastName, email, password)
  values
  ('srPies', 'ligeros', 'srPies@email.com', 'password' ),
  ('memo', 'locura', 'memo@email.com', 'password' ),
  ('flaco', 'valiente', 'flaco@email.com', 'password' )
-- @block
insert into message_app.messages
  (messageContent, user_id)
  values
  ('srPies message', 1 ),
  ('I am a awesome rich Dog...', 1 ),
  ('flaco RUles', 3 )

-- @block
select * from message_app.messages;
-- @block
select * from message_app.users inner join message_app.messages on message_app.messages.user_id = message_app.users.id;
-- @block
select * from message_app.users left join message_app.messages on message_app.messages.user_id = message_app.users.id;
-- @block
select * from message_app.users right join message_app.messages on message_app.messages.user_id = message_app.users.id;

-- @block
select * from message_app.users;
-- @block
select id, firstName, lastName from message_app.users order by id desc limit 2;
-- @block
select * from message_app.users where firstName = 'srPies' and id > 0;
select id, firstName, lastName from message_app.users order by id desc limit 2;
-- @block
select * from message_app.users;

-- @block
insert into blog_database.posts 
  (first_name, last_name, phone, email, passwordHash)
  values
  ('memo', 'locura', '123456', 'memo@email.com', 'password' ),
  ('flaco', 'valiente', '123456', 'flaco@email.com', 'password' )

-- @block
select * from blog_database.user;