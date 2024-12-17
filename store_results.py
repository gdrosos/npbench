import pandas as pd
from npbench.infrastructure import utilities as util


if __name__ == "__main__":
    # Create a database connection
    database = r"npbench.db"
    conn = util.create_connection(database)
    data = pd.read_sql_query("SELECT * FROM results", conn)
    data.to_csv("results.csv")
