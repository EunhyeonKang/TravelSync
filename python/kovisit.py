from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
import pandas as pd

query_txt = input('크롤링할 키워드는 무엇입니까?: ')
f_name = input('검색 결과를 저장할 txt 파일경로와 이름을 지정하세요(예:c:\\temp\\test.txt): ')
fc_name = input('검색 결과를 저장할 csv 파일경로와 이름을 지정하세요(예:c:\\temp\\test.csv): ')

# Step 1. 크롬 드라이버를 사용해서 웹 브라우저를 실행합니다.
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.get("https://korean.visitkorea.or.kr/main/main.do")
time.sleep(2)

#/Users/admin/Downloads/kopo/final/python/kovisit.txt
#검색창을 찾아 검색어 입력
driver.find_element(By.CLASS_NAME,'btn_search').click()

element = driver.find_element(By.ID, 'inp_search')

element.send_keys(query_txt)

#검색 버튼을 눌러 실행
driver.find_element(By.CSS_SELECTOR,'.search_form > .btn_search').click()
time.sleep(2) 

all_data = []  # 모든 페이지의 데이터를 저장할 리스트
page_num = 1  # 페이지 번호 초기화

while True:
    #bs4
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')
    #데이터 내용에서 주요 부분 골라내기
    content_list = soup.find('ul','list_thumType type1')

    for li_tag in content_list.find_all('li'):
        if page_num > 1:
            try:
                contents = li_tag.find('div', 'tit').get_text()

         
                photo = li_tag.find('img').get("src")
                
                service_div = soup.find('div', class_='service')
                p_content = service_div.find('p').get_text()

                tag = li_tag.find('p', 'tag_type').get_text()

                # 데이터를 딕셔너리에 추가
                data_entry = {'내용': contents,'사진':photo, '지역': p_content, '태그': tag}
                all_data.append(data_entry)
            except:
                pass  # 내용이 없으면 건너뜁니다.

    next_page_link = soup.find('div', {'id','page_box'}).find('a', id=str(page_num))
    if next_page_link:
        #a_page_link = driver.find_element(By.CSS_SELECTOR, f'div#page_box a.on')
        #a_page_link = driver.find_element(By.CSS_SELECTOR, f'div#page_box > a:nth-child({current_page})')
        a_page_link = driver.find_element(By.CSS_SELECTOR, f'#page_box > a[id="{page_num}"]')
        a_page_link.click()
        page_num += 1
        time.sleep(2)  # Adjust the delay as needed
    else:
        break



# 모든 페이지의 데이터를 파일에 저장
with open(f_name, 'w', encoding='UTF-8') as f:
    for data in all_data:
        f.write(f"내용: {data['내용']},\n사진: {data['사진']},\n지역: {data['지역']},\n태그: {data['태그']},\n\n")

# 출력 결과를 표(데이터 프레임) 형태로 만들기
korea_trip = pd.DataFrame(all_data)

# csv 형태로 저장하기
korea_trip.to_csv(fc_name, index=False, encoding="utf-8-sig")
print(" csv 파일 저장 경로: %s" % fc_name)

driver.quit()