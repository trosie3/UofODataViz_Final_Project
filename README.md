# Pet_Finder_Adoption_Prediction
Link to dashboard - https://public.tableau.com/app/profile/spring7540/viz/AdoptionSpeedbyWordCountDashboard/Story1?publish=yes 
Google slides link - https://docs.google.com/presentation/d/1FmbpduJhPG039F80fj9dI67I5SFkxphLvJbuMMcZSPg/edit#slide=id.p

## Project Overview
Our group chose pet adoption speed as our topic, because the members of our group are animal lovers. We want to create a machine learning model that predicts the adoption speed. As we are working with data from a previously completed Kaggle challenge and with a limited 4-week timeline, we set our target accuracy at 42.3+% as that would at least get us in the ‘bronze’ if we been participating been in the Kaggle competition when it was open. The top 10 (non-cheating) finalists were all at 44.1+% in the initial contest.

### Source Data
Our dataset lists instances of pets that were, or are up for adoption in 2018.
We obtained dataset from Kaggle's 2018 PetFinder competition. https://www.kaggle.com/c/petfinder-adoption-prediction/data

### Technology used & explanation of those choices
Technology file[link](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/technology.md 'link to technology breakdowns')

### Questions to Answer
The question we are seeking to answer with our model is the adoption speed of each pet. The secondary question is what features are most important to predicting this adoption speed, and what suggestions can we make based on that data?

### Group Communication Protocols
Slack group: group_project_team_1
- Let the team know if you are going to miss a scheduled get together time
- Let the team know when requested when you can meet next
- @ Rosie when have a pull request so she can do merges to the main branch
- If struggling with anything don't hesitate reach out to team and/or Terra (project mentor) or Heather (instructor)

## Data exploration & pre-processing for model
- Raw data from train.csv: 14993 rows, 24 columns

### Data used & definitions 
Data definition file [link](https://github.com/trosie3/UofODataViz_Final_Project/blob/main/data_definitions.md 'link to data definitions')
Data cleaning code files [link](https://github.com/trosie3/UofODataViz_Final_Project/tree/main/Cleaning:Preprocessing "link to code folder")
- Cleaned data from clean_trained: 14981 rows, 20 columns (dropped 12 rows with missing data, and ID columns)
- Largest amount of data points in speed 2 and 4, followed but 3 and 1, with speed 0 having far fewer thn all data points. (image of speed breakdown)

### Assumptions made on which features would have an impact
- A common saying is 'dogs are man’s best friend' so we suspect that type of pet (dog or cat) to have an impact (image of graph we made)
  - At speed 0 and 1, cats appear to be adopted slightly faster. Speed 4 (which is still in shelter) more dog than cats appear to still be unadopted.
- Health of the pet might have a significant impact, most people would probably adopt healthy over injured. (image of graph we made)
  - Most pets appear to be healthy in this data set, and the pattern of speed follows that of the overall speed break down.
- Age of the pet to have a large impact. Everyone loves kittens and puppies, and older pets may be 'less adoptable.' (image of graph we made)
  - Most pets are under the 65 month. This graph does appear t show that as age increased and the time it tkaes a pet to get adopted increases as well.
- The number of photos of the pet(s) will a have an impact, if looking online you are probably looking for pictures and then scrolling through them as part of the decision process. (image of graph we made)
  - Most pets have photos, bulk of them have between 1 and 5 photos.
- A common thought is that black pets are less adoptable, so 'color1' might have more an impact (image of graph we made)
  - For both cats and dogs, the largest number of pets are still at the shelter(speed 4). Compared to othr single colored animals a pattern is hard to discern, other than of the single colored animals there are more black only pets in this dataset over.
- The description will likely be at least somewhat important perhaps towards the top, not everyone reads descriptions but many do. (image of speed vs word count)
  - At most descriptions are under 250 words, with the three faster speed being closer to 200. There does appear to be some coordination that as word count goes up the timeline of the pet adoption also increases.

## Model Results
We ran 10 different RandomForestClassifer model iterations.

75/25 split, cleaned_train.csv used

- Model 1
  - Features used: all
  - Classification Report: (image)
  - Accuracy Score: 41.35
  - Feature importance: (image)
- Model 2
  - Features used: all but type, videoamt, health
  - Classification Report: (image)
  - Accuracy Score: 41.59
- Model 3
  - Features used: only these: word_count, photoamt, age, color2, bread1, color1, breed2
  - Classification Report: (image)
  - Accuracy Score: 36.28
- Model 4
  - Features used: all but type, videoamt, health, vaccinanted, sterilized
  - Classification Report: (image)
  - Accuracy Score: 41.19
- Model 5
  - Features used: all with transformed word_count into wordbins but type, health, videoamt
  - Classification Report: (image)
  - Accuracy Score: 41.14
  - Feature importance:
- Model 6 (a check to ensure word_count wasn't pulling the model accuracy down even though 'top feature')
  - Features used: all but type, videoamt, health, word_count/wordbins
  - Classification Report: (image)
  - Accuracy Score: 39.86
  - Feature importance:
  
75/25 split, cleaned_train_optimized.csv used (see if removed stop words helps improve model)

- Model 7
  - Features used: all with optimzed_word_count (stop words removed) 
  - Classification Report: (image)
  - Accuracy Score: 40.44
  - Feature importance: (image)
- Model 8
  - Features used: all with optimzed_word_count (stop words removed) but type, videoamt, health
  - Classification Report: (image)
  - Accuracy Score: 40.79

80/20 split, cleaned_train.csv used (back to first csv because 1 and 2 best models so far)

- Model 9 
  - Features used: all
  - Classification Report: (image)
  - Accuracy Score: 42.24
  - Feature importance: (image)
- Model 10
  - Features used: all but type, videoamt, health
  - Classification Report: (image)
  - Accuracy Score: 42.54

## Summary & Findings
Model 10, 9, 2, and 1 were our best models. Models 10 and 2 dropped the 3 features shown in the feature_importances_ function as the least important. Models 9 and 1 used all features. Models 1 and 2 were done on a 75/25 split, and model 2 was the more accurate of the two. Models 9 and 10 were done on a 80/20 split, were the top two performing models we created, and model 10 was the best/most accurate model we created. (image of graph we made of model 9 and 10?)

Top Three Features from best model:
Word_count (decripton column transformation), Age, and PhotoAmt (transformed into the bins we created). Even though Age and PhotoAmt switched places these three features remained key in each model iteration regardless of split or csv pulled in. 

Bottom three & least important features:
Type, Health and VideoAmt. We can safety say least important features as our best performing from models in the 75/25 split and 80/20 split dropped these features entirely and their scores improved compared to the models that used all features. (image of final feature importance graph)

Based on our assumptions: what we got right, wrong, and what we missed:
- Wrong : Type and Health, they were actually 2 of the least important features. Also, single color wasn't as important as we suspected it might be. Type was actually really surprising to all of us, we really thought dog versus cat might matter more.
- Right : word_count (thus description) although more important than we originally expected, age and photo amt. All of these turned out to be the top features regardless of model iteration.
- Missed : Color2 more important than we would have guessed (in top 5 features), which kind of make sense and most animals probably are dual-colored. Fee was also lower than we would have thought though we didn't expect it to be a top feature. 
- Unsurprised by: Most of the bottom half features.

Elephant in the room, while our final model performed well at 42.5% which in the original competition would have gotten us in the bronze and even the best entry had an accuracy of only 44.99%, these models probably are not that helpful to PetFinder for actually predicting adoption speed. However, we can make some suggestions based on our findings, that may produce better data for the next attempt.

- Have a description, not too long less than 200 words but also more than 40 seems to be key at the faster adoption speeds.
- Have photos of the pets: at least 1 images and up to 5 appears to be the ticket for faster adoption speeds. More than that is a waste of resources.
- Age matters the bulk of all pets regardless of speed were under 65 months, and there appears to be a correlation with adoption speed and age as age goes up so does length of time to adopt. Perhaps with consistent photos/descriptions would help with older pets.
- No video needed. One of the least important features so either not enough videos to fairly judge, or videos aren’t needed thus a waste of resources.
- Focus on the 'health' feature of the pet not necessary. If putting in description probably a ‘waste of words.’

If these changes where to made to make some things more consistent perhaps the next attempt at making a model for PetFinder would allow for better models.

### Limitations & Recommendations to improve
Time 
 - Given our 4 week project deadline, what we could perform and analyze was limited. If we had more time we could have:
   - Tried other types of models and compared them. 
   - Adjusting bins/catergories we made perhaps some of them weren't as accurate as they could have been. Better categorization could have increase accuracy.
   - After removing stop words in the optimization run through, we could have attempted the binning process to see if that made a difference, as logic suggestions removing the stop words should have improved the model but it didn't.
   - Better yet we could have performed a full Natural Language Processing breakdown on the description column instead of only looking at the word lenght in each description. By being able to look at the sentiment of a description and rank those descriptions, it may have increased the accuracy of the model.
 
Data
  - Limited amount of data point in Adoption Speed 0, which is also where even our best models struggled predicting the most. Perhaps if there had been a more evenly distributed amount of data points in each Adoption Speed Bin the model could have been trained better.
  - Adoption Speed already binned prior to our accessing the data. Given that adoption speed is based on a time-line, had this not previously be categorized we could have performed a LinearRegression Model which could have given us more clues as to where things weren’t aligning, and perhaps could have been more accurate.
  - With photoamt being a ke feature, perhaps if the images were provided an analysis of the images could be performed to key into what images help make the pets more adoptable which would then better their adaoption timeline.
