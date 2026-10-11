import duckdb
from pathlib import Path

DB_PATH = "data/warehouse.duckdb"
SQL_DIR = Path("sql")

con = duckdb.connect(DB_PATH)
for schema in ["staging", "intermediate", "marts"]:
    con.execute(f"CREATE SCHEMA IF NOT EXISTS {schema}")

# Run every .sql file in folder order (01_staging, 02_..., 03_...)
for sql_file in sorted(SQL_DIR.glob("*/*.sql")):
    print(f"running {sql_file}")
    con.execute(sql_file.read_text())

con.close()
