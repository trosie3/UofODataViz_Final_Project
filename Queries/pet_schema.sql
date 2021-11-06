-- Creating tables for PF_PetDB
CREATE TABLE breed_labels (
	breed_id VARCHAR(3) NOT NULL,
	type INT,
	breed_name VARCHAR(47) NOT NULL,
	PRIMARY KEY (breed_id),
	UNIQUE (breed_name)
	);

CREATE TABLE color_labels (
	color_id INT,
	color_name VARCHAR(8) NOT NULL,
	PRIMARY KEY (color_id),
	UNIQUE (color_name)
	);
	
CREATE TABLE pet_mockup (
	type INT,
	age VARCHAR(3) NOT NULL,
	breed_id1 VARCHAR(3) NOT NULL,
	breed_id2 VARCHAR(3) NOT NULL,
	gender INT,
	color_id1 INT,
	color_id2 INT,
	color_id3 INT,
	maturity_size INT,
	fur_length INT,
	vaccinated INT,
	dewormed INT,
	sterilized INT,
	health INT,
	fee VARCHAR(4),
FOREIGN KEY (breed_id1) REFERENCES breed_labels (breed_id),
FOREIGN KEY (breed_id2)	REFERENCES breed_labels (breed_id),
FOREIGN KEY (color_id1) REFERENCES color_labels (color_id),
FOREIGN KEY (color_id2) REFERENCES color_labels (color_id),
FOREIGN KEY (color_id3) REFERENCES color_labels (color_id)
	);
	
	