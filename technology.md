# Technologies Used
## Data Cleaning and Analysis
Python and Pandas will be used to clean the data and perform an exploratory analysis.

## Database Storage
Postgres(cloud) is the database we intend to use. 
For connecting to the database - SQlAlchemy will be used to integrate the Google Colab notebooks and the database to both pull in data for the model, and export data to the database as needed.

## Machine Learning Model
We will use the sklearn library to pull in what we need to run the model.
Our model is a supervised machine learning model because we had outcomes to compare our predictions to and can use the 'accuracy_score' function for sklearn. Given that the adoption speed outcomes were already binned, the model we will use is the RandomForestClassifier. The advantage of this model for us is it has the 'feature_importances_' function, and as part of our question we hope to identify is the features that have the most and least effect on adoption speed. Drawbacks to using this model: it requires more computational power, can be slower to train, and can be biased towards categorical variables.

## Dashboard
We are using Tableau to create a comprehensive and comprehensible presentation. We are integrating Google Slides into out Tableau story-board to create a better story and presentation. We are also using filtering within Tableau to give our presented information interactive features. That way our audience can filter the visuals to focus in on a particular aspect, or possibly answer their own questions that we may not cover with our story.
