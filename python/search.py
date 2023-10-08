import pandas as pd
import numpy as np
from faker import Faker
import random
from datetime import datetime,timedelta

# CSV 파일을 DataFrame으로 읽어옵니다.
csv_file_path = "./data/kovisit1.csv"  # 실제 파일 경로로 변경하세요
df = pd.read_csv(csv_file_path)

# "지역"과 "내용" 컬럼만 추출하여 새로운 데이터프레임을 생성합니다.
new_df = df[["지역", "내용"]].copy()

# Faker 객체 생성
fake = Faker()
data = []


# Weighted random choice for search_place
costList7 = ['서울', '인천', '경기도']
weightsList7 = [40, 30, 30]  # Adjusted to sum up to 1

def gen_cost(costList,weightsList):
    cost=random.choices(costList, weights=weightsList,k=1)[0]
    return cost

def gen_date(start_date,end_date):
    
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return random_date.strftime('%Y/%m/%d')

for _ in range(0, 50000):  # Change the range to generate 10,000 rows
    search_history_id = np.random.randint(1000000, 9999999)

    # Assign "서울" to search_place with a weight of 50%
    if gen_cost(costList7, weightsList7) == '서울':
        selected_row = new_df[new_df['지역'].str.split(" ").str[0] == '서울'].sample(n=1)
        # Retrieve the "지역" value at the selected index and remove the extra whitespace
        random_location = selected_row['지역'].values[0].strip()
    elif gen_cost(costList7, weightsList7) == '경기도':
        selected_row = new_df[new_df['지역'].str.split(" ").str[0] == '경기도'].sample(n=1)
        # Retrieve the "지역" value at the selected index and remove the extra whitespace
        random_location = selected_row['지역'].values[0].strip()
    elif gen_cost(costList7, weightsList7) == '인천':
        selected_row = new_df[new_df['지역'].str.split(" ").str[0] == '인천'].sample(n=1)
        # Retrieve the "지역" value at the selected index and remove the extra whitespace
        random_location = selected_row['지역'].values[0].strip()
    
    # search_date = fake.date_between(start_date='-1y', end_date='today')

    cust_start_day1 = 28
    cust_start_month1 = 9
    cust_start_year1 = 2023

    cust_end_day1 = 5
    cust_end_month1 = 10
    cust_end_year1 = 2023

    cust_start_date1 = datetime(cust_start_year1, cust_start_month1, cust_start_day1)
    cust_end_date1 = datetime(cust_end_year1, cust_end_month1, cust_end_day1)


    cust_end_date1
   
    # tags = df["태그"]
    # if any(keyword in tags for keyword in ["음식", "식당"]):
    #     search_industry_code = 'F'
    # elif any(keyword in tags for keyword in ["숙박", "호텔"]):
    #     search_industry_code = 'A'
    # elif any(keyword in tags for keyword in ["문화", "공연"]):
    #     search_industry_code = 'E'
    # else:
    #     # If none of the keywords are found, choose randomly based on the given probabilities
    #     search_industry_code = np.random.choice(['F', 'A', 'E'], p=[0.4, 0.4, 0.2])

    member_id = np.random.randint(100000, 999999)
    
    data.append([search_history_id, str(random_location), gen_date(cust_start_date1,cust_end_date1),"location", member_id])

# 데이터프레임 생성
df = pd.DataFrame(data, columns=["SEARCH_HISTORY_ID", "SEARCH_KEYWORD", "search_date","SEARCH_TYPE","member_id"])

# 데이터프레임을 CSV 파일로 저장
df.to_csv("random_search_history.csv", index=False)