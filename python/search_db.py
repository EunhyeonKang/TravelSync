import pandas as pd

# Read the CSV file into a DataFrame
csv_file = 'random_search_history.csv'  # Replace with the path to your CSV file
df = pd.read_csv(csv_file)

# Generate SQL insert statements
insert_statements = []
for index, row in df.iterrows():
    search_history_id = int(row['SEARCH_HISTORY_ID'])
    search_keyword = f"'{row['SEARCH_KEYWORD']}'" if not pd.isna(row['SEARCH_KEYWORD']) else 'NULL'
    search_date = f"'{row['search_date']}'" if not pd.isna(row['search_date']) else 'NULL'
    search_type = f"'{row['SEARCH_TYPE']}'" if not pd.isna(row['SEARCH_TYPE']) else 'NULL'
    member_id = int(row['member_id'])

    insert_statement = f"INSERT INTO search_location_history (search_history_id, search_keyword, search_date, search_type, member_id) VALUES ({search_history_id}, {search_keyword}, {search_date}, {search_type}, {member_id});"
    insert_statements.append(insert_statement)

# Save insert statements to a SQL file
with open('search_data.sql', 'w') as sql_file:
    sql_file.write('\n'.join(insert_statements))

print("SQL insert statements saved to 'insert_data.sql'")
