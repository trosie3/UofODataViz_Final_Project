# Pet_Finder_Adoption_Prediction

## Project Overview

### Pet Adoption Speeds
Our team chose pet adoption speeds as out topic because as a group we havea all had pets and some of us currently have pets. However, seeing which factors may 
influence the speed at which animals are adopted is something we are wanting to investigate. We are also wanting to find out  which factors have the largest effect on 
the speed of adoption.

### Source Data
Our dataset lists instances of pets that were, or are up for adoption. It lists both cats and dogs, and occasionally groups of pets that show up as one listing, but
have a greater quantity. Cleaning this data will be something we have to focus on in order to get accurate data.
We obtained dataset from kaggle's petfinder competition. https://www.kaggle.com/c/petfinder-adoption-prediction/data

### Questions to Answer
The questions we are seeking to answer is "what is the adoption?" Through processing, cleaning, and analysing the data, we hope to find
the answer and what qualities play into adoption speed

https://public.tableau.com/app/profile/spring7540/viz/AdoptionSpeedbyWordCountDashboard/Story1?publish=yes 

#### Keep in mind for machine learning model & analysis
Which model did you choose and why?
Since we are looking at the what affects the speed of the adoption and there are 4 types of speed (classification) therefore we are using random forest classifier model.

### How are you training your model?
- Remove null values.
- Remove the columns that are irrevelent for our project.
- Train-test split
- Apply NLP to description field.

### What is the model's accuracy?
The model's accuracy score is only 33% which is low but this was using the mockup data - will access again with real data, if accuracy too low will consider other models/methods. 

### How does this model work?
We chose The random forest model because: 

- Are robust against overfitting as all of those weak learners are trained on different pieces of the data.
- Can be used to rank the importance of input variables in a natural way.
- Can handle thousands of input variables without variable deletion.
- Are robust to outliers and nonlinear data.
- Run efficiently on large datasets.

## Communication Protocols
Slack group: group_project_team_1
- Let the team know if you are going to miss class or a scheduled get together time
- Let the team know when requested when you can meet next
- @ Rosie when have a pull request so she can do merges to the main branch
- If struggling with anything don't hesitate reach out to team and/or Terra or Heather
