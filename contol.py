from sqlalchemy.engine import URL
from sqlalchemy import create_engine
import pandas as pd

host = "127.0.0.1"
database = "postgres"
user = "postgres"
password = "postgres"

engine = create_engine('postgresql://postgres:postgres@localhost/postgres')

def get_dataframe(tablename) :
    return pd.read_sql_query('select * from '+ tablename,con=engine)

