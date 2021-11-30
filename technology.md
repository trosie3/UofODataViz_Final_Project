# Technologies Used
## Data Cleaning and Analysis
Python and Pandas were used to clean the data and perform an exploratory analysis performed in Google Colab. 
We used the NLTK (Natural Language Toolkit) library to remove stop words from the description, condensing our word count down to meaningfull and descriptive words in our training_data_cleaned_optimized.ipynb notebook. 

## Database Storage
Postgres(cloud) is the database we used. 
For connecting to the database - SQlAlchemy was used to integrate the Google Colab notebooks and the database to both pull in data for the model, and export data to the database as needed. [Instructions for connecting to database.](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Queries/database_instructions.md 'link to db instruc')

## Machine Learning Model
We used the sklearn library to pull in what we needed to run the model within Google Colab.
Our model is a supervised machine learning model because we had outcomes to compare our predictions to and can use the 'accuracy_score' function for sklearn. Given that the adoption speed outcomes were already binned, the model we used is the RandomForestClassifier. The advantage of this model for us is it has the 'feature_importances_' function, and as part of our question we hope to identify is the features that have the most and least effect on adoption speed. Drawbacks to using this model: it requires more computational power, can be slower to train, and can be biased towards categorical variables.

## Dashboard
We used Tableau to create a comprehensive and comprehensible presentation. We integrated Google Slides into our Tableau story-board to create a better story and presentation. We also used filtering within Tableau to give our presented information interactive features. With the interactive features our audience can filter the visuals to focus in on a particular aspect, or possibly answer their own questions that we may not cover with our story initally.
