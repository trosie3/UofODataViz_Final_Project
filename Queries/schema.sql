-- Creating tables for PF_PetDB

CREATE TABLE cleaned_train(
	Type INT,
	Age INT,
	Breed1 INT,
	Breed2 INT,
	Gender INT,
	Color1 INT,
	Color2 INT,
	Color3 INT,
	MaturitySize INT,
	FurLength INT,
	Vaccinated INT,
	Dewormed INT,
	Sterilized INT,
	Health INT,
	Quantity INT,
	VideoAmt INT,
	PhotoAmt DECIMAL,
	AdoptionSpeed INT,
	word_count INT,
	Fee_bins INT
	
	);

	Creating tables for PF_PetDB
CREATE TABLE breed_labels (
	breedid INT,
	type INT,
	breedname VARCHAR NOT NULL,
	UNIQUE (breedname)
	);

CREATE TABLE color_labels (
	colorid INT,
	colorname VARCHAR NOT NULL,
	UNIQUE (colorname)
	);