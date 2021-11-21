-- Creating tables for database, run colab notebooks to pull data in or upload from csvs in 'data' folder
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

CREATE TABLE rf_model_data (
	index INT,
	Model_Num INT,
	Accuracy_Score(%) Float,
	Train_and_Test_Splits(%) VARCHAR,
	Features_Used VARCHAR,
	Model_Ranking INT
	);

CREATE TABLE rf_predictions_75train25test(
	index INT,
	Actual INT,
	Model_1 INT,
	Model_2 INT,
	Model_3 INT,
	Model_4 INT,
	Model_5 INT,
	Model_6 INT,
	Model_7 INT,
	Model_8 INT
	);

CREATE TABLE rf_predictions_80train20test(
	index INT,
	Actual INT,
	Model_1 INT,
	Model_9 INT,
	Model_10 INT
	);

-- upload data from cvs for next two tables after creating them
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

-- STOP, make sure data in all tables before next queries
-- use SELECT * FROM tablename;

-- create optimized view for models in 80/20 view for viz
 SELECT 'Actual'::text AS category,
    rf_predictions_80train20test.index,
    rf_predictions_80train20test.actual AS accuracy
   FROM rf_predictions_80train20test
UNION
 SELECT 'Model 9'::text AS category,
    rf_predictions_80train20test.index,
    rf_predictions_80train20test.model_9 AS accuracy
   FROM rf_predictions_80train20test
UNION
 SELECT 'Model 10'::text AS category,
    rf_predictions_80train20test.index,
    rf_predictions_80train20test.model_10 AS accuracy
   FROM rf_predictions_80train20test;
-- after view is created
SELECT * from actual_vs_predicted; -- then F8 to download csv to use in Tableau


-- join breed labels and color labels to cleaned_train (project requirement to have a join in database, no needed outside of that)
-- change column titles used in join to lowercase
SELECT ct.color1, ct.color2, ct.color3
FROM cleaned_train AS ct
LEFT JOIN color_labels AS cl ON
ct.color1=cl.colorid AND
ct.color2=cl.colorid AND
ct.color3=cl.colorid;

SELECT ct.breed1, ct.breed2
FROM cleaned_train AS ct
LEFT JOIN breed_labels AS bl ON
ct.breed1=bl.breedid AND
ct.breed2=bl.breedid;