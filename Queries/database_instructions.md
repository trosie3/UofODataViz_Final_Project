# how to create, login locally, and code for notebooks

## to set up clouddata base (first time)
 - go to AWS
 - login
 - follow instuctions set up a new RDS instance for pdAdmin
 - get endpoint and follow next steps

## To connect to the cloud database (for the team after intial set up)
- pgAdmin4
- create new server
 - name: AWS
 - endpoint: 'dataviz.c6b1qjayiqhf.us-west-2.rds.amazonaws.com'
 - postgres / postgres
 - password (see config) shared config sperately via slack channel as gitignore will keep it from uploading to github
- first person to connect - use schema to set up tables
- first person to connect -pull in matching files from data folder into tables created

## To connect in colab use the following code:
- imports
        import pandas as pd
        import sqlalchemy

        from getpass import getpass
        password = getpass('Enter database password')

        install postgres https://stackoverflow.com/questions/61030755/connect-to-postresql-database-from-google-colab
        !pip install psycopg2-binar
        !service postgresql start
        !sudo -u postgres psql -c "CREATE USER postgres WITH SUPERUSER"

- set connection
        %load_ext sql
        %config SqlMagic.feedback=False 
        %config SqlMagic.autopandas=True
        %sql postgresql+psycopg2://postgres:{password}@dataviz.c6b1qjayiqhf.us-west-2.rds.amazonaws.com:5432/postgres #database string

- write code to pull data in from the data base connection string don't use ()
        (dataframename) = %sql SELECT * FROM (table you want to pull data from);