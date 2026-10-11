import duckdb
from pathlib import Path

RAW_DIR = Path("data/raw")
DB_PATH = "data/warehouse.duckdb"
TABLES = ["patients", "conditions", "medications", "encounters"]

con = duckdb.connect(DB_PATH)
con.execute("CREATE SCHEMA IF NOT EXISTS raw")

for t in TABLES:
    path = RAW_DIR / f"{t}.csv"
    con.execute(
        f"CREATE OR REPLACE TABLE raw.{t} AS "
        f"SELECT * FROM read_csv_auto('{path}', header=true)"
    )
    n = con.execute(f"SELECT COUNT(*) FROM raw.{t}").fetchone()[0]
    print(f"raw.{t}: {n:,} rows")

con.close()
