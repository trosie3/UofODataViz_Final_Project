# Pet_Finder_Adoption_Prediction
Link to dashboard - https://public.tableau.com/app/profile/spring7540/viz/AdoptionSpeedbyWordCountDashboard/Story1?publish=yes 

## Project Overview
Our group chose pet adoption speeds as out topic because as a group we have all had pets and some of us currently have pets. We want to create a machine learning model that predicts the adoption speed. As we are working with data from a previously completed Kaggle challenge and with a limited 4-week timeline, we set our target accuracy at 42.3+% as that would at least get us in the ‘bronze’ if we been participating been in the Kaggle competition when it was open. The top 10 (non-cheating) finalists were all at 44.1+% in the initial contest.

### Source Data
Our dataset lists instances of pets that were, or are up for adoption in 2018.
We obtained dataset from Kaggle's 2018 PetFinder competition. https://www.kaggle.com/c/petfinder-adoption-prediction/data

### Technology used & explanation of those choices
Technology file (link)

### Questions to Answer
The question we are seeking to answer with our model is the adoption speed of each pet. Secondary question, is what features are most important to predicting this adoption speed, and what suggestions can we make based on that data.

### Group Communication Protocols
Slack group: group_project_team_1
- Let the team know if you are going to miss a scheduled get together time
- Let the team know when requested when you can meet next
- @ Rosie when have a pull request so she can do merges to the main branch
- If struggling with anything don't hesitate reach out to team and/or Terra (project mentor) or Heather (instructor)

## Data exploration & pre-processing for model
Raw data from train.csv: 14993 rows, 24 columns

### Data used & definitions 
Data definition file (link)
Cleaned data from clean_trained: 14981 rows, 20 columns (dropped 12 rows with missing data, and ID columns)

### Assumptions made on which features would have an impact
- A common saying is 'dogs are man’s best friend' so we suspect that type of pet (dog or cat) to have an impact
- Health of the pet might will have a significant impact, most people would probably adopt healthy over injured.
- Age of the pet to have a large impact. Everyone loves kittens and puppies, and older pets may be 'less adoptable.'
- The number of photos of the pet(s) will a have an impact, if looking online you are probably looking for pictures and then scrolling through them as part of the decision process.
- A common thought is that black pets are less adoptable, so 'color1' might have more an impact
- The description will likely be at least somewhat important perhaps towards the top, not everyone reads descriptions but many do. 

## Model Results
We ran 10 different RandomForestClassifer model iterations.
75/25 split, cleaned_train.csv used
- Model 1
 - Features used: all
 - Classification Report:
 - Accuracy Score: 41.35
 - Feature importance:
- Model 2
 - Features used: all but type, videoamt, health
 - Classification Report:
 - Accuracy Score: 41.59
- Model 3
 - Features used: only these: word_count, photoamt, age, color2, bread1, color1, breed2
 - Classification Report:
 - Accuracy Score: 36.28
- Model 4
 - Features used: all but type, videoamt, health, vaccinanted, sterilized
 - Classification Report:
 - Accuracy Score: 41.19
 - Feature importance:
- Model 5
 - Features used: all with transformed word_count into wordbins
 - Classification Report:
 - Accuracy Score: 41.14
 - Feature importance:
- Model 6 (a check to ensure word_count wasn't pulling the model accuracy down even though 'top feature')
 - Features used: all but type, videoamt, health, word_count/wordbins
 - Classification Report:
 - Accuracy Score: 39.86
75/25 split, cleaned_train_optimized.csv used (see if removed stop words helps improve model)
- Model 7
 - Features used: all with optimzed_word_count (stop words removed) 
 - Classification Report:
 - Accuracy Score: 40.44
 - Feature importance:
- Model 8
 - Features used: all with optimzed_word_count (stop words removed) but type, videoamt, health
 - Classification Report:
 - Accuracy Score: 40.79
80/20 split, cleaned_train.csv used (back to first csv because 1 and 2 best models so far)
- Model 9 
 - Features used: all
 - Classification Report:
 - Accuracy Score: 42.24
 - Feature importance:
- Model 10
 - Features used: all but type, videoamt, health
 - Classification Report:
 - Accuracy Score: 42.54

## Summary & Findings
Model 10, 9, 2, and 1 were out best models. Models 10 and 2 dropped the 3 features show in the feature_importances_ function as the least important. Models 9 and 1 used all features. Models 1 and 2 were done on a 75/25 split, and model 2 was the more accurate of the two. Models 9 and 10 were done on a 80/20 split, were the top two performing models we created, and model 10 was the best/most accurate model we created.

Top Three Features from best model:
Word_count (decripton column transformation), Age, and PhotoAmt (transformed into the bins we created). Even though Age and PhotoAmt switched places these three features remained key in each model iteration regardless of split or csv pulled in.

Bottom three & least important features:
Type, Health and VideoAmt. We can safety say least important features as our best performing from models in the 75/25 split and 80/20 split dropped these features entirely and their scores improved compared to the models that used all features.

Finding based on our assumptions, what we got right, wrong, and what we missed:

### Limitations & Recommendations 
Time 
 - Given our 4 week project deadline, what we could perform and analyze was limited. If we had more time we could have:
  - Tried other types of models and compared them. 
  - Found a better way bin word_count to make it work for the model, than the initial way we attempted.
  - After removing stop words in the optimization run through, we could have attempted a bin to see if that made a difference as logic suggestions removing the stop words should have improved the model but it didn't.
  - Better yet we could have performed full NLP on the description column instead of only looking at word count. By being able to look at the sentiment of a description and rank those descriptions, may have increased the accuracy of the model as well as helped PetFinder by allowing us to make a better recommendation than just a possible description length/limit.
 
Data
 - Limited amount of data point in Adoption Speed 0, which is also where even our best models struggled predicting the most. Perhaps if there had been a more evenly distributed amount of data points in each Adoption Speed Bin the model could have been trained better.
 - Adoption Speed already binned prior to our accessing the data. Given that adoption speed is based on a time-line, had this not previously be categorized we could have performed a LinearRegression Model which has better accuracy than a RandomForest and performs better at predicting time.
