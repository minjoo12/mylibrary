CREATE DATABASE IF NOT EXISTS mylibrary
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE mylibrary;

CREATE TABLE IF NOT EXISTS user (
	id VARCHAR(32) PRIMARY KEY COMMENT "id",
	password VARCHAR(32),
	email VARCHAR(32),
	name VARCHAR(64),
	tel VARCHAR(32)
	birth VARCHAR(32)
	);