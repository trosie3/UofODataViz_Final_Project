# PetFinder Adoption Prediction

[Link to Dashboard with Integrated Google Slides](https://public.tableau.com/app/profile/spring7540/viz/PetFinder_PredictionofAdoptionSpeed/PetFinderStory?publish=yes 'link to dashboard')

[Google Slides Only](https://docs.google.com/presentation/d/1FmbpduJhPG039F80fj9dI67I5SFkxphLvJbuMMcZSPg/edit#slide=id.p 'link to gs')

## Project Overview
Our group chose pet adoption as our topic, because we are animal lovers. The purpose of this project is to create machine learning model that predicts the adoption speed, and see what features affect the model. We are working with data from a previously completed Kaggle challenge and with a limited 4-week timeline, due to that we set our target accuracy at 42.3+% as that would have achieved ‘bronze’ if we had been participating in the original Kaggle competition. The top 10 (non-cheating) finalists were all at 44.1% or higher, with the best model at 44.99%.

### Source Data
Our dataset lists instances of pets that were up for adoption in 2018.
We obtained the dataset from Kaggle's 2018 PetFinder competition. [Link to Kaggle Data](https://www.kaggle.com/c/petfinder-adoption-prediction/data 'link to kaggle')

### Technology used & explanation of those choices
[Technology Breakdown](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/technology.md 'link to technology breakdowns')

### Questions to Answer
The question our model attempts to find is the adoption speed of each pet. The secondary question is what features impact predicting the adoption speed, and what suggestions can we make based on that data.

## Data exploration & pre-processing for model
- Raw data from train.csv: 14993 rows, 24 columns

### Data used & definitions
[Data Definitions](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/data_definitions.md 'link to data definitions')

Data cleaning and pre-processing for model [link to code](https://github.com/trosie3/UofODataViz_Final_Project/tree/main/Cleaning:Preprocessing "link to code folder")
- Cleaned data from clean_trained: 14981 rows, 20 columns (dropped 12 rows with missing data, and ID columns)
- Largest amount of data points in speed 2 and 4, followed but 3 and 1, with speed 0 having far fewer than the rest.
![image](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed.png)


### Assumptions made on which features would have an impact on our model
- A common saying is 'dogs are man’s best friend,' so we suspect the type of pet (dog or cat) to have an impact. 
  - At speed 0 and 1, cats appear to be adopted slightly faster. Speed 4 (which is still in shelter) more dogs than cats appear to still be unadopted.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed_by_type.png' width=70% height=70%>
- Health of the pet might have a significant impact, most people would probably adopt a healthy pet over injured.
  - Most pets appear to be healthy in this data set, and the pattern of speed follows that of the overall data points.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/health_filtered_by_adoption_speed.png' width=70% height=70%>
- Age of the pet is expected to have an impact. Everyone loves kittens and puppies, and older pets may be 'less adoptable.'
  - Most pets appear to be under 65 months old. This graph does appear to show that as age increases the time it takes a pet to get adopted increases as well.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed_by_age.png' width=70% height=70%>
- The number of photos of the pet(s) will a have an impact, if looking online a person probably looks for pictures and then scrolls through them as part of the decision making process.
  - Most pets have photos, bulk of them have between 1 and 5 photos.
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/photo_amount_filtered_by_adoption_speed.png' width=70% height=70%>
- A common thought is that black pets are less adoptable, so 'color1' might have more an impact.
  - For both cats and dogs, the largest number of datapoints are pets at the shelter (speed 4). Compared to other single-colored animals, a pattern is hard to discern, other than - of the single-colored animals - there appear to be more black pets in this dataset. 
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/adoption_speed_of_black_pets.png' width=70% height=70%>
- Description will likely be at least somewhat important perhaps towards the top, not everyone reads descriptions, but many might (based on the fact that our whole team would read them).
  - Most descriptions lengths (word_count) are under 250 words, with the three faster speeds being closer to 200. There does appear to be some coordination that as word count goes up the timeline of the pet adoption also increases.
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
- Model 6 (a check to ensure word_count wasn't pulling the model accuracy down even though it was a 'top feature')
  - Features used: all but type, videoamt, health, word_count/wordbins
  - Classification Report:
  <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/model6_cr.png' width=40% height=40% align=center>
  
  - Accuracy Score: 39.86
  
75/25 split, cleaned_train_optimized.csv used (To see if removing stop words helps to improve the model)

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
- Model 10 target accuracy hit / **Final Model**
  - Features used: all but type, videoamt, health
  - Confusion Matrix and Classification Report: <img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/model%20images/finalmodelcrcm.png' width=60% height=60% align=left>
      - Actual 0 count 73 vs Predicted 0 count 6 : way under on total number, did poorly at getting any of speed 0 right
      - Actual 1 count 631 vs Predicted 1 count 589 : slightly under on total number, we did fairly well at getting speed 1 right
      - Actual 2 count 806 vs Predicted 2 count 830 : slightly over on total number, did fairly well at getting speed 2 right
      - Actual 3 count 633 vs Predicted 3 count 511 : under on total number, did okay at getting of speed 3 right
      - Actual 4 count 854 vs Predicted 4 count 1061 : over on total number, did well at getting most of speed 4 right
  - Accuracy Score: 42.54

## Summary
Model 10, 9, 2, and 1 were our top performing machine learning models. Models 9 and 1 used all features, while model 10 and 2 prunned health, type and videoamt. Models 1 and 2 were trained on a 75% split leaving 25% for testing, of the two model 2 was better. Models 9 and 10 were trained on a 80% split, these became the top two performing models we created, with model 10 being the top performing model and thus our final model. Our final model predicted adoption speeds 1 and 2 well, did okay at speed 3 and 4, but performed poorly at predicting speed 0 when looking at total count of datapoints (see image below). If looking at the model's recall (see the confusion matrix above) this model did best at prediciting adoption speed 4, well at speed 1 and 2, okay at speed 3 and very poorly at speed 0.

<img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/actual_vs_predicted_accuracy.png' width=60% height=60%>

### Feature Findings
Top Three Features: 
Word_count (description column transformation), age, and photoamt (transformed into the bins we created). Even though age and photoamt switched places from the first feature_importances_ pull to the final one, these three features remained key in each model iteration. 

Bottom Three & Least Important Features:
Type, health and videoamt. We can safely say these are the least important features as our best performing from models in both the 75/25 split and 80/20 split did not use these features, and their accuracy scores improved.

<img src='https://github.com/trosie3/UofODataViz_Final_Project/blob/main/Visuals/graphs/feature_importance.png' width=80% height=80%>

Based on our assumptions what we got right, wrong, and what we missed in Feature Importance:
- Wrong : Type and health, they were actually two of the least important features. Also, single color wasn't as important as we suspected it might be. Type was actually really surprising to all of us, we really thought dog versus cat would matter more.
- Right : word_count aka description (this feature turned out to more important than we originally suspected it might), age and photo amt were also top features. All of these turned out to be the top features regardless of data/csv used.
- Missed : Color2 more important than we would have guessed (in top 5 features), which make sense in hindsight as most animals probably are dual-colored over a single color. Fee was also less important than we would have thought even though we didn't expect it to be a top feature. 
- Unsurprised by: Most of the bottom half features.

## Recommendations Based on Findings
Elephant in the room regarding our final model, while our final model performed well at 42.54% in the context of the Kaggle competition where even the best entry was only at 44.99%, these models are no more helpful to PetFinder for actually predicting adoption speed than flipping a coin. However, we can make some suggestions based on our findings that may produce better data for the next attempt at creating a model.

- Have a description. Limit the length to 200 words but also more than 40, based on the graph we produced.
- Have between 1 and 5 photos of the pet(s). More than that is a waste of resources as most pets were adopted with those numbers.
- Age matters, the bulk of all pets regardless of adoption speed were under 65 months, and there appears to be a correlation with adoption speed and age - as age goes up so does length of time to adopt. Perhaps consistent photos/descriptions would help with older pets.
- No video needed. As one of the least important features making videos is a waste of resources. However, we should note this could be due to so few pets having videos in this dataset that this feature was one of the least important.
- Focus on the 'health' of the pet not necessary. If writing a description no need to mention that the pet(s) is healthy.

If these changes were to made perhaps the next attempt at making a model for PetFinder would produce a model that could actually be used in making adoption speed predictions.

### Limitations & Recommendations to Improve
Time 
 - Given our 4-week project deadline, what we could perform and analyze was limited. If we had more time we could have:
   - Tried other types of models and compared them to the RandomForestClassifier. 
   - Adjusted the bins/categories we made, perhaps some of them weren't as representative of the data as they could have been. Better categorization could have increase accuracy.
   - After removing stop words in the optimization run through, we could have attempted the binning process to see if that made a difference. Logic suggests removing the stop words should have improved the model, but it didn't so this needs further exploring.
   - Lastly, we could have performed a full Natural Language Processing breakdown on the description column instead of only looking at the word length in each description. By being able to look at the content and sentiment of a description it may have increased the accuracy of the model as well as provided more insight as to what the description should say over just our suggestion for between 40-200words needed.
 
Data
  - Limited amount of data points in Adoption Speed 0, which is also where even our best model struggled predicting. Perhaps if there had been a more evenly distributed amount of data points in each adoption speed the model could have been trained better thus producing a model better at prediciting adoption speed.
  - Adoption speed already pre-categorized. Given that adoption speed is based on a time-line, had this not previously be categorized we could have performed a LinearRegression Model which could have given us more insight as to where/what the model was struggling to predict, and perhaps could have been more accurate model.
  - With photoamt being a key feature, perhaps if the images were provided an analysis of the images could be performed to key into what images help make the pets more adoptable, which could lead to suggestions on what those 1-5 photos should be rather than just the number suggested.

With more time and/or better data, perhaps we could have made a better model, and/or come up with more ways PetFinder could improve individual listings. Plus, improved listing could lead to fewer pets still in the shelter after 100 days, which had the largest count of data points in this dataset.
