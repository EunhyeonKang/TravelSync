# 입력 파일 경로
input_file_path = 'kovisit3.txt'

# 출력 SQL 파일 경로
output_sql_file = 'kovisit3.sql'

# SQL 파일에 저장할 데이터를 담을 리스트
data_entries = []

def clean_data(data):
    cleaned_data = {}
    for key, value in data.items():
        cleaned_value = value.replace("'", "")  # 작은따옴표 제거
        cleaned_value = cleaned_value.replace("&", "")  # '&' 제거
        cleaned_data[key] = cleaned_value.strip()  # 공백 제거
    return cleaned_data

with open(input_file_path, 'r', encoding='utf-8') as f:
    lines = f.read().split('\n\n')
    
    for entry in lines:
        data = {}
        lines_split = entry.strip().split('\n')
        
        for line in lines_split:
            key_value = line.split(':', 1)  # 최대 2개의 값으로 분할
            if len(key_value) == 2:
                key, value = key_value
                data[key.strip()] = value.strip()
        
        if data:  # 빈 딕셔너리가 아닌 경우에만 추가
            cleaned_data = clean_data(data)
            data_entries.append(cleaned_data)

# 데이터를 SQL 파일에 쓰기
with open(output_sql_file, 'w', encoding='utf-8') as f:
    for idx, data in enumerate(data_entries, start=1):
        content = data.get('내용', '').rstrip(' ,')
        photo = data.get('사진', '').rstrip(' ,')
        location = data.get('지역', '').rstrip(' ,')
        tags = data.get('태그', '').rstrip(' ,')
        
        query = f"INSERT INTO travleInfo (t_num, content, photo, location, tags, travel_type) " \
                f"VALUES (seq_t_num.NEXTVAL, '{content}', '{photo}', '{location}', '{tags}','국내');\n"
        f.write(query)
