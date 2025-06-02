create database if not exists instagram_db;
use instagram_db;

create table users (
	user_id int primary key auto_increment,
    username varchar(50) unique not null,
    email varchar(100) unique not null,
    password varchar(255) not null,
    created_at datetime default current_timestamp
);

create table follows (
	follower_id int,
    followed_id int,
    created_at datetime default current_timestamp,
    primary key (follower_id, followed_id),
    foreign key (follower_id) references users(user_id) on delete cascade,
    foreign key (followed_id) references users(user_id) on delete cascade,
    check (follower_id != followed_id)
);

create table posts (
	post_id int primary key auto_increment,
    user_id int not null,
    caption text,
    media_url varchar(255),
    created_at datetime default current_timestamp,
    foreign key (user_id) references users(user_id) on delete cascade
);

create table likes (
	like_id int primary key auto_increment,
    post_id int not null,
    user_id int not null,
    created_at datetime default current_timestamp,
    foreign key (post_id) references posts(post_id) on delete cascade,
    foreign key (user_id) references users(user_id) on delete cascade
);

create table comments (
	comment_id int primary key auto_increment,
    user_id int not null,
    post_id int not null,
    content text,
    created_at datetime default current_timestamp,
    foreign key (user_id) references users(user_id) on delete cascade,
    foreign key (post_id) references posts(post_id) on delete cascade
);

create table stories (
	story_id int primary key auto_increment,
    user_id int not null,
    media_url varchar(255),
    created_at datetime default current_timestamp,
    expires_at datetime,
    foreign key (user_id) references users(user_id)
);

DELIMITER $$
create trigger set_expires_at_before_insert
before insert on stories
for each row
begin
	if new.expires_at is null then 
		set new.expires_at = date_add(new.created_at, interval 24 hour);
	end if;
end $$

DELIMITER ;