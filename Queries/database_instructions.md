### Database connecting to Postgres Guestview

* username : guestview
* password : guest1234
* database : postgres
* endpoint : dataviz.c6b1qjayiqhf.us-west-2.rds.amazonaws.com:5432
* URI : postgresql+psycopg2://guestview:guest1234@dataviz.c6b1qjayiqhf.us-west-2.rds.amazonaws.com:5432/postgres 

#### Connecting to Python in Colab
* Packages to install
  ```
     import pandas as pd
     import SQLAlchemy
     from SQLAlchemy import create_engine

     # install postgres https://stackoverflow.com/questions/61030755/connect-to-postresql-database-from-google-colab
     !pip install psycopg2-binary==2.9.2
     !service postgresql start
     !sudo -u postgres psql -c "CREATE USER postgres WITH SUPERUSER"

     %load_ext sql
     %config SqlMagic.feedback=False 
     %config SqlMagic.autopandas=True
     # database string format: postgresql+psycopg2://postgres:password@endpoint:5432/postgres 
     # %sql URI (uncomment)
     ```
* example code: 
  ```
    (newdataframename) = %sql SELECT * FROM (table you want to pull data from);
    db_string = URI
    engine = create_engine(db_string)
    (dataframe you want to export).to_sql(name='(table you want to add data to)', con=engine, if_exists='replace')
