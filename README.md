# Pet_Finder_Adoption_Prediction

## Communication Protocols
Slack group: group_project_team_1
- Let the team know if you are going to miss class or a scheduled get together time
- Let the team know when requested when you can meet next
- @ Rosie when have a pull request so she can do merges to the main branch
- If struggling with anything don't hesitate reach out to team and/or Terra or Heather


#### Keep in mind for machine learning model & analysis
Which model did you choose and why?
Since we are looking at the what affects the speed of the adoption and there are 4 types of speed (classification) therefore we are using random forest classifier model.

### Data source:
We obtained dataset from kaggle.
### How are you training your model?

- Remove null values.
- Remove the columns that are irrevelent for our project.
- Train-test split
- Apply NLP to description field.

### What is the model's accuracy?
The model's accuracy score is only 33% which is low therefore we will apply other machine learning models such as neural network, Adaboost or aome other model for the real data.

### How does this model work?
We chose The random forest model because: 

- Are robust against overfitting as all of those weak learners are trained on different pieces of the data.
- Can be used to rank the importance of input variables in a natural way.
- Can handle thousands of input variables without variable deletion.
- Are robust to outliers and nonlinear data.
- Run efficiently on large datasets.
