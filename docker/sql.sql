create database ctf;
use ctf;
CREATE TABLE `user` (
  `id` int key AUTO_INCREMENT,
  `username` varchar(128) unique,
  `password` text
);
CREATE TABLE `avatar` (
  `userid` int unique,
  `img` text DEFAULT NULL,
  FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
);
CREATE USER 'ctf'@`%` IDENTIFIED BY '123456';
GRANT SELECT ON ctf.user TO 'ctf'@'%';
GRANT ALL ON ctf.avatar TO 'ctf'@'%';
insert into user (username,password) values('admin','ce22fc18731ee1d66623b442c750233b');