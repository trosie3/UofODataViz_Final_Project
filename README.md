# PetFinder Adoption Prediction

[Link to Dashboard with Integrated Google Slides](https://public.tableau.com/app/profile/spring7540/viz/PetFinder_PredictionofAdoptionSpeed/PetFinderStory?publish=yes 'link to dashboard')

[Google Slides Only](https://docs.google.com/presentation/d/1FmbpduJhPG039F80fj9dI67I5SFkxphLvJbuMMcZSPg/edit#slide=id.p 'link to gs')

## Project Overview
Our group chose pet adoption speed as our topic, because the members of our group are animal lovers. We want to create a machine learning model that predicts the adoption speed. As we are working with data from a previously completed Kaggle challenge and with a limited 4-week timeline, we set our target accuracy at 42.3+% as that would at least get us in the ‘bronze’ if we been participating been in the Kaggle competition when it was open. The top 10 (non-cheating) finalists were all at 44.1+% in the initial contest, with the best at 44.99%.

### Source Data
Our dataset lists instances of pets that were, or are up for adoption in 2018.
We obtained dataset from Kaggle's 2018 PetFinder competition. [Link to Kaggle Data](https://www.kaggle.com/c/petfinder-adoption-prediction/data 'link to kaggle')

### Technology used & explanation of those choices
[Technology Breakdown](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/technology.md 'link to technology breakdowns')

### Questions to Answer
The question we are seeking to answer with our model is the adoption speed of each pet. The secondary question is what features are most important to predicting this adoption speed, and what suggestions can we make based on that data.

## Data exploration & pre-processing for model
- Raw data from train.csv: 14993 rows, 24 columns

### Data used & definitions
[Data Definitions](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/data_definitions.md 'link to data definitions')

Data cleaning and pre-processing for model [link to code](https://github.com/trosie3/UofODataViz_Final_Project/tree/main/Cleaning:Preprocessing "link to code folder")
- Cleaned data from clean_trained: 14981 rows, 20 columns (dropped 12 rows with missing data, and ID columns)
- Largest amount of data points in speed 2 and 4, followed but 3 and 1, with speed 0 having far fewer than the rest.
![image](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed.png)

### Assumptions made on which features would have an impact
- A common saying is 'dogs are man’s best friend' so we suspect that type of pet (dog or cat) to have an impact 
  - At speed 0 and 1, cats appear to be adopted slightly faster. Speed 4 (which is still in shelter) more dogs than cats appear to still be unadopted.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed_by_type.png' width=70% height=70%>
- Health of the pet might have a significant impact, most people would probably adopt healthy over injured.
  - Most pets appear to be healthy in this data set, and the pattern of speed follows that of the overall speed break down.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/health_filtered_by_adoption_speed.png' width=70% height=70%>
- Age of the pet to have a large impact. Everyone loves kittens and puppies, and older pets may be 'less adoptable.'
  - Most pets are under the 65 months old. This graph does appear to show that as age increased and the time it takes a pet to get adopted increases as well.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed_by_age.png' width=70% height=70%>
- The number of photos of the pet(s) will a have an impact, if looking online you are probably looking for pictures and then scrolling through them as part of the decision process.
  - Most pets have photos, bulk of them have between 1 and 5 photos.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/photo_amount_filtered_by_adoption_speed.png' width=70% height=70%>
- A common thought is that black pets are less adoptable, so 'color1' might have more an impact
  - For both cats and dogs, the largest number of datapoints are still at the shelter (speed 4). Compared to other single-colored animals, a pattern is hard to discern, other than - of the single-colored animals - there appear to be more black pets. 
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed_of_black_pets.png' width=70% height=70%>
- The description will likely be at least somewhat important perhaps towards the top, not everyone reads descriptions, but many do.
  - At most descriptions are under 250 words, with the three faster speeds being closer to 200. There does appear to be some coordination that as word count goes up the timeline of the pet adoption also increases.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/asvswdwithbwp.png' width=50% height=50%>

## Model Results
We ran 10 different RandomForestClassifier model iterations. [Link to code](https://github.com/trosie3/UofODataViz_Final_Project/tree/main/Model 'line to ml')

75/25 split, cleaned_train.csv used

- Model 1  <img src="https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model1_fi.png" width=40% height=40% align=right>
  - Features used: all
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model1_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 41.35
  - Feature importance: to the right
- Model 2
  - Features used: all but type, videoamt, health
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model2_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 41.59
- Model 3
  - Features used: only these: word_count, photoamt, age, color2, bread1, color1, breed2
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model3_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 36.28
- Model 4
  - Features used: all but type, videoamt, health, vaccinanted, sterilized
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model4_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 41.19
- Model 5 <img src="https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model5_fi.png" width=40% height=40% align=right>
  - Features used: all with transformed word_count into wordbins but type, health, videoamt
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model5_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 41.14
  - Feature importance: to the right
- Model 6 (a check to ensure word_count wasn't pulling the model accuracy down even though 'top feature')
  - Features used: all but type, videoamt, health, word_count/wordbins
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model6_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 39.86
  
75/25 split, cleaned_train_optimized.csv used (see if removed stop words helps improve model)

- Model 7 <img src="https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model7_fi.png" width=40% height=40% align=right>
  - Features used: all with optimzed_word_count (stop words removed) 
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model7_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 40.44
  - Feature importance: to the right 
- Model 8
  - Features used: all with optimzed_word_count (stop words removed) but type, videoamt, health
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model8_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 40.79

80/20 split, cleaned_train.csv used (back to first csv because 1 and 2 best models so far)

- Model 9 <img src="https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model9_fi.png" width=40% height=40% align=right>
  - Features used: all
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model9_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 42.24
  - Feature importance: to the right
- Model 10, target accuracy hit / **Final Model**
  - Features used: all but type, videoamt, health
  - Confusion Matrix and Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/finalmodelcrcm.png' width=60% height=60% align=center>
  
  - Accuracy Score: 42.54

## Summary & Findings
Model 10, 9, 2, and 1 were our best models. Models 10 and 2 dropped the 3 features shown in the feature_importances_ function as the least important. Models 9 and 1 used all features. Models 1 and 2 were done on a 75/25 split, and model 2 was the more accurate of the two. Models 9 and 10 were done on a 80/20 split, were the top two performing models we created, and model 10 was the best/most accurate model we created. Our Models predicted speed 1 and 2 well, did okay at speed 3 and 4 but not great, and performed poorly at predicting speed 0.

<img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/actual_vs_predicted_accuracy.png' width=60% height=60%>

### Features
Top Three Features from best model: 
Word_count (description column transformation), Age, and PhotoAmt (transformed into the bins we created). Even though Age and PhotoAmt switched places these three features remained key in each model iteration regardless of split or csv pulled in. 

Bottom three & least important features:
Type, Health and VideoAmt. We can safely say these are the least important features as our best performing from models in the 75/25 split and 80/20 split dropped these features entirely, and their scores improved compared to the models that used all features. 

<img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/feature_importance.png' width=80% height=80%>

Based on our assumptions what we got right, wrong, and what we missed in Feature Importance:
- Wrong : Type and Health, they were actually two of the least important features. Also, single color wasn't as important as we suspected it might be. Type was actually really surprising to all of us, we really thought dog versus cat might matter more.
- Right : word_count (thus description) although more important than we originally expected, age and photo amt. All of these turned out to be the top features regardless of model iteration.
- Missed : Color2 more important than we would have guessed (in top 5 features), which kind of make sense and most animals probably are dual-colored. Fee was also lower than we would have thought though we didn't expect it to be a top feature. 
- Unsurprised by: Most of the bottom half features.

## Recommendations Based on Findings
Elephant in the room, while our final model performed well at 42.5% which in the original competition would have gotten us in the bronze and even the best entry had an accuracy of only 44.99%, these models probably are not that helpful to PetFinder for actually predicting adoption speed. However, we can make some suggestions based on our findings, that may produce better data for the next attempt.

- Have a description, not too long less than 200 words but also more than 40 seems to be key at the faster adoption speeds.
- Have photos of the pets: at least 1 image and up to 5 appears to be the ticket for faster adoption speeds. More than that is a waste of resources.
- Age matters: the bulk of all pets, regardless of adoption speed were under 65 months, and there appears to be a correlation with adoption speed and age- as age goes up so does length of time to adopt. Perhaps consistent photos/descriptions would help with older pets.
- No video needed. One of the least important features- so either not enough videos to fairly judge, or videos aren’t needed- thus a waste of resources.
- Focus on the 'health' feature of the pet not necessary. If putting in description probably a ‘waste of words.’

If these changes where to made to make some things more consistent perhaps the next attempt at making a model for PetFinder would allow for better models.

### Limitations & Recommendations to improve
Time 
 - Given our 4-week project deadline, what we could perform and analyze was limited. If we had more time we could have:
   - Tried other types of models and compared them. 
   - Adjusting bins/categories we made perhaps some of them weren't as accurate as they could have been. Better categorization could have increase accuracy.
   - After removing stop words in the optimization run through, we could have attempted the binning process to see if that made a difference, as logic suggests removing the stop words should have improved the model, but it didn't.
   - Better yet we could have performed a full Natural Language Processing breakdown on the description column instead of only looking at the word length in each description. By being able to look at the sentiment of a description and rank those descriptions, it may have increased the accuracy of the model.
 
Data
  - Limited amount of data point in Adoption Speed 0, which is also where even our best models struggled predicting the most. Perhaps if there had been a more evenly distributed amount of data points in each Adoption Speed Bin the model could have been trained better.
  - Adoption Speed already binned prior to our accessing the data. Given that adoption speed is based on a time-line, had this not previously be categorized we could have performed a LinearRegression Model which could have given us more clues as to where things weren’t aligning, and perhaps could have been more accurate.
  - With photo amt being a key feature, perhaps if the images were provided an analysis of the images could be performed to key into what images help make the pets more adoptable, which would then better their adoption timeline.
