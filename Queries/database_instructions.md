# how to create, login locally, and code for notebooks

## to set up clouddata base (first time through only)
 - go to AWS
 - login
 - follow instuctions set up a new RDS instance for pdAdmin 
 - get endpoint and follow next steps

## To connect to the cloud database (for the team after intial set up from step above)
- pgAdmin4
- create new server
 - endpoint: 'dataviz.c6b1qjayiqhf.us-west-2.rds.amazonaws.com'
 - postgres / postgres
 - password (see config) shared config sperately via slack channel as gitignore will keep it from uploading to github
- first person to connect to live database: use schema to set up tables, upload color/breed labels csvs, run colab notebooks (both data cleaning and mlmodel) to pull in the rest of the tables

## To create a local a local data instead of linking to cloud database
- pgAdmin4
- create new database
- open query tool
- use schema to create tables
- upload csvs in 'data' folder into tables, and run colab notebooks to download table data that way

## To connect to database in colab use the following code:
- imports
        import pandas as pd
        import sqlalchemy
        from sqlalchemy import create_engine

        from getpass import getpass
        password = getpass('Enter database password')

        install postgres https://stackoverflow.com/questions/61030755/connect-to-postresql-database-from-google-colab
        !pip install psycopg2-binary==2.9.2
        !service postgresql start
        !sudo -u postgres psql -c "CREATE USER postgres WITH SUPERUSER"

- set connection
        %load_ext sql
        %config SqlMagic.feedback=False 
        %config SqlMagic.autopandas=True
        # database string format: postgresql+psycopg2://postgres:password@endpoint:5432/postgres 
        %sql postgresql+psycopg2://postgres:{password}@dataviz.c6b1qjayiqhf.us-west-2.rds.amazonaws.com:5432/postgres 

- write code to pull data in from the data base connection string, don't use ()
        example: (newdataframename) = %sql SELECT * FROM (table you want to pull data from);
- write code to export data into database, don't use ()
        example: db_string = f"postgresql+psycopg2://postgres:{password}@dataviz.c6b1qjayiqhf.us-west-2.rds.amazonaws.com:5432/postgres"
        engine = create_engine(db_string)
        (dataframe you want to export).to_sql(name='(table you want to add data to)', con=engine, if_exists='replace')