# Definitions of Columns in Dataset

## Target data
AdoptionSpeed - value we are trying to predict
Categorical speed of adoption. Lower is faster.
- 0 - Pet was adopted on the same day as it was listed
- 1 - Pet was adopted between 1 and 7 days (1st week) after being listed
- 2 - Pet was adopted between 8 and 30 days (1st month) after being listed
- 3 - Pet was adopted between 31 and 90 days (2nd & 3rd month) after being listed
- 4 - No adoption after 100 days of being listed. (There are no pets in this dataset that waited between 90 and 100 days)

## Feature data
### Transformed data defintions
Fee_bins - Adoption fee (Original fee column dropped and replaced with this data)
- 0 - free
- 1 - fee 1-50
- 2 - fee 51-100
- 3 - fee 101-150
- 4 - fee 151-200
- 5 - fee 201+

Quantity - Number of pets represented in a profie (original values replaced with these data bins)
- 1 - 1 pet
- 2 - 2 pets
- 3 - 3 pets
- 4 - 4 pets
- 5 - 5 pets
- 6 - 6 or more

PhotoAmt - Total uploaded photos(pics) for a profile (original values replaced with these data bins)
- 0 - no pics
- 1 - 1 pic
- 2 - 2 pics
- 3 - 3 pics
- 4 - 4 pics
- 5 - 5 pics
- 6 - 6 pics
- 7 - 7 pics
- 8 - 8 pics
- 9 - 9 pics
- 10 - 10 pics
- 11 - 11 pics
- 12 - 12 pics
- 13 - 13 or more pics

word_count - Number of words in the Description column of a profile. The Description column was dropped and replaced with this data because that data was a string and we wanted a numeric value to perform analysis on.

word_count_optimized - Number of words in the Description column of a profile with stop words removed. Second try at Description column to see if would make ther model more effective. We dropped raw Description and replaced it with this data because the original Description column values were strings and we wanted a numeric value to perform analysis on.  We wanted to see if stop words played a role in the model.

### unchanged columns definitions:
- Type - Type of animal (1 = Dog, 2 = Cat)
- Age - Age of pet when listed, in months
- Breed1 - Primary breed of pet (Refer to BreedLabels.csv dictionary)
- Breed2 - Secondary breed of pet, if pet is of mixed breed (Refer to BreedLabels csv dictionary)
- Gender - Gender of pet (1 = Male, 2 = Female, 3 = Mixed, if profile represents group of pets)
- Color1 - Color 1 of pet (Refer to ColorLabels csv dictionary)
- Color2 - Color 2 of pet (Refer to ColorLabels csv  dictionary)
- Color3 - Color 3 of pet (Refer to ColorLabels csv dictionary)
- MaturitySize - Size at maturity (1 = Small, 2 = Medium, 3 = Large, 4 = Extra Large, 0 = Not Specified)
- FurLength - Fur length (1 = Short, 2 = Medium, 3 = Long, 0 = Not Specified)
- Vaccinated - Pet has been vaccinated (1 = Yes, 2 = No, 3 = Not Sure)
- Dewormed - Pet has been dewormed (1 = Yes, 2 = No, 3 = Not Sure)
- Sterilized - Pet has been spayed / neutered (1 = Yes, 2 = No, 3 = Not Sure)
- Health - Health Condition (1 = Healthy, 2 = Minor Injury, 3 = Serious Injury, 0 = Not Specified)
- VideoAmt - Total uploaded videos for this pet

## Dropped columns - didn't transform or use in model, all these columns are identification columns
- PetID - Unique hash ID of pet profile
- Name - Name of pet (Empty if not named)
- State - State location in Malaysia (Refer to StateLabels dictionary)
- RescuerID - Unique hash ID of rescuer
