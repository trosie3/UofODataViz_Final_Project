-- Creating tables for could database
-- right now train table code might have issue cant get csv to upload after creating table so commenting out
-- CREATE TABLE train(
	--Type INT,
	--Name VARCHAR,
	--Age INT,
	--Breed1 INT,
	--Breed2 INT,
	--Gender INT,
	--Color1 INT,
	--Color2 INT,
	--Color3 INT,
	--MaturitySize INT,
	--FurLength INT,
	--Vaccinated INT,
	--Dewormed INT,
	--Sterilized INT,
	--Health INT,
	--Quantity INT,
	--Fee INT,
	--State INT,
	--RescuerID VARCHAR,
	--VideoAmt INT,
	--Description VARCHAR,
	--PetID VARCHAR,
	--PhotoAmt DECIMAL
	--AdoptionSpeed INT
	--);


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

CREATE TABLE cleaned_train_optimized(
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
	optimized_word_count INT,
	Fee_bins INT
	);

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