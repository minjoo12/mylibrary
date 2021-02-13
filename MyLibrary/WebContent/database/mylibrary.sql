CREATE DATABASE IF NOT EXISTS mylibrary
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE mylibrary;

CREATE TABLE IF NOT EXISTS user (
	id VARCHAR(32) PRIMARY KEY COMMENT "id",
	password VARCHAR(32),
	email VARCHAR(32),
	name VARCHAR(64),
	tel VARCHAR(32),
	birth VARCHAR(32)
	);
	
CREATE TABLE IF NOT EXISTS bookdb (
   booknum VARCHAR(256) PRIMARY KEY,
   bookname2 VARCHAR(256),
   writer2 VARCHAR(256),
   publisher2 VARCHAR(256),
   bookbirth VARCHAR(256),
   bookloca VARCHAR(256)
   );
   
CREATE TABLE IF NOT EXISTS basket (
   bookname2 VARCHAR(256) PRIMARY KEY,
   writer2 VARCHAR(256)
   );
   
CREATE TABLE IF NOT EXISTS baedalinfo (
   sjuso VARCHAR(256) PRIMARY KEY,
   phone VARCHAR(256),
   pay VARCHAR(256)
   );
   
  CREATE TABLE IF NOT EXISTS juso (
   zip_code VARCHAR(256) PRIMARY KEY,
   roadAddress VARCHAR(256)
   );