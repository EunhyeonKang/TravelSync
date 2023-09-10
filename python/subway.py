import csv

# CSV 파일 경로와 SQL 파일 경로를 설정합니다.
csv_file_path = '/Users/admin/Downloads/subwayinfo.csv'
sql_file_path = '/Users/admin/Downloads/kopo/final/python/subway.sql'

# INSERT 문 생성 함수
def generate_insert_sql(subway_id, line_num, subway_nm, km):
    if km == '':
        km = 1
    return f"INSERT INTO subway_data (subway_id, line_num, subway_nm, km) VALUES ({subway_id}, '{line_num}', '{subway_nm}', {km});"

# CSV 파일 읽기 및 SQL 생성
try:
    with open(csv_file_path, 'r', encoding='cp949') as csv_file, open(sql_file_path, 'w', encoding='utf-8') as sql_file:
        csv_reader = csv.reader(csv_file)
        next(csv_reader)  # 헤더 행 스킵
        
        subway_id = 1  # 초기 subway_id 값
        
        for row in csv_reader:
            line_num, subway_nm, km = row
            insert_sql = generate_insert_sql(subway_id, line_num, subway_nm, km)
            sql_file.write(insert_sql + '\n')
            
            subway_id += 1

    print('SQL 파일이 생성되었습니다.')

except Exception as e:
    print('오류가 발생했습니다:', e)
