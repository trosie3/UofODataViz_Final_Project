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
CREATE TABLE cats_only(
	Type INT,
	age INT,
	breed_id1 INT,
	breed_id1 INT,
	gender INT,
	color_id1 INT,
	color_id2 INT,
	color_id3 INT,
	maturity_size INT,
	Fur_length INT,
	vaccinated INT,
	dewormed INT,
	sterilized INT,
	health INT,
	quantity INT,
	videoamt INT,
	photoamt DECIMAL,
	adoptionspeed INT,
	word_count INT,
	fee_bins INT
	);
CREATE TABLE dogs_only(
	Type INT,
	age INT,
	breed_id1 INT,
	breed_id1 INT,
	gender INT,
	color_id1 INT,
	color_id2 INT,
	color_id3 INT,
	maturity_size INT,
	Fur_length INT,
	vaccinated INT,
	dewormed INT,
	sterilized INT,
	health INT,
	quantity INT,
	videoamt INT,
	photoamt DECIMAL,
	adoptionspeed INT,
	word_count INT,
	fee_bins INT
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
CREATE TABLE final_models_feature_importance (
	Feature Names TEXT
	Importances double precision
	);
