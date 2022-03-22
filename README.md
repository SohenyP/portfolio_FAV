# 🍋FAV. For All of Vegetarians. | 페이브
지역별 채식당 정보 및 예약 제공하는 개인 프로젝트

## 🗂️INDEX
- [Introduction](#introduction)
- [Goal](#goal)
- [User](#user)
- [Period](#period)
- [Tech Stack](#tech-stack)
- [Detail of Development](#detail-of-development)
- [To-Be](#to-be)
- [Demonstration](#demonstration)
- [Attached](#attached)
</br>

## 📢Introduction
> - 한국 채식비건협회에 따르면 국내 채식 선호 인구는 약 250만 명([첨부1](#첨부1))
> - 국내 대형유통가 중심 채식 열풍까지 불어 성장 가능성 있는 시장으로 평가 ([첨부1](#첨부1))
> - '코페르니쿠스 지속가능발전연구소' 보고서, 소 1kg 육류 생산시 단계별 최대 2227톤(MtCO2) 발생 ([첨부2](#첨부2))
#
## 🎯Goal
> - #### 채식 시도 증가로 온실가스 절감 효과 기대
> - #### 육식 또는 채식에 치우치지 않은 다양한 식습관의 대중화
#
## 👨‍👩‍👧‍👦User
> - 다양한 식생활을 시도하고 싶은 사람
> - 채식당 정보를 얻기 힘든 사람
> - 웨이팅 없이 채식당을 즐기고 싶은 사람
> - 종교, 건강, 윤리적 이유로 채식을 막 시작하려는 사람 
> - 세계의 채식 축제를 알고싶은 사람
#
## ⏰Period 
> #### 2022.12 ~
#
## 🛠Tech Stack
> - #### BackEnd       
>   - <img src="https://img.shields.io/badge/Java-007396?style=plastic&logo=Java&logoColor=white"> <b>SE-14</b></br>
>   - <img src="https://img.shields.io/badge/Spring-6DB33F?style=plastic&logo=Spring&logoColor=white"> <b>5.2.2.RELEASE</b></br>
>   - <img src="https://img.shields.io/badge/MariaDB-003545?style=plastic&logo=MariaDB&logoColor=white"> <b>10.6.5</b></br>
>   
> - #### FrontEnd
>   - <img src="https://img.shields.io/badge/HTML5-E34F26?style=plastic&logo=HTML5&logoColor=white"></br>
>   - <img src="https://img.shields.io/badge/CSS3-1572B6?style=plastic&logo=CSS3&logoColor=white"></br>
>   - <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=plastic&logo=JavaScript&logoColor=white"></br>
>   - <img src="https://img.shields.io/badge/jQuery-0769AD?style=plastic&logo=jQuery&logoColor=white"></br>
>   
> - #### WAS
>    - <img src="https://img.shields.io/badge/ApacheTomcat-F8DC75?style=plastic&logo=ApacheTomcat&logoColor=white"> <b>9.0.54</b></br>
>    
> - #### API
>   - <b>Google Map API</b>
>   - <b>i'mport - Payment System</b>
>   - <b>다음 우편번호 API</b>
#
## 📝Detail of Development
> - #### 메인 페이지
>   - 상단 Nav
>     - Front
>       1. (scrollTop / (scrollHeight - clientHeight)) * 100으로 현재 Y스크롤 위치 퍼센티지 산출
>       2. 특정 퍼센티지 벗어날 시, Nav CSS 변화
>     - Back
>       1. 우측 상단 유저 아이콘 hover시 세션 정보 유무에 따라 로그인/회원가입 or 로그아웃/마이페이지
>       
>   - 공지 슬라이더
>     - Front
>       1. setTimeout, button.addEventListener, display 속성 변화 이용한 오토, 버튼 슬라이더
>       
>   - 지역별 식당찾기
>     - Front
>       1. 지역 아이콘별 form value=지역으로, 클릭시 controller 전달해 식당 지역 한정
>       2. addEventListener("wheel")로 div 진입시 deltaY < 0 따라 left -50 or 50씩 이동
>
>   - 이달의 페이브
>     - Front
>       1. article마다 getBoundingClientRect().top - window.innerHeight이 지정 값 벗어날시 slide-in-bottom 효과
>       2. 예약하기 버튼 클릭시 form:hidden value=식당정보 예약form으로 전달
>       
>   - 이달의 축제
>     - Front
>       1. 이미지 파일명에 숫자 부여해 Math.round(Math.random() * ((max-min+1)+min))로 난수 추출
>       2. 로딩 시 매번 다른 이미지 파일 추출
>                    
> - #### 로그인/로그아웃
>   - 로그인
>     - Back
>       1. 로그인 정보 sumbit시 controller 이동해 service에서 회원테이블 DB 존재 여부 체크
>       2. ID, PW 일치 / ID 일치 / 탈퇴한 회원(PW = NULL) / 차단회원 (memberType = blocked) 구분
>       3. 로그인 결과별 문구 model 통해 VIEW단 전송
>       4. ID, PW 일치 시, session.setAttribute(회원정보) 및 메인페이지 이동
>       5. 예외 발생시 예외 페이지 이동
>       
>   - 로그아웃
>     - Back
>       1. 로그아웃 시 session.invalidate()으로 세션 초기화
>       2. location.pathname.split('/')[index]으로 path 뽑아 requestParam으로 받아서 마지막 위치로 이동 
>       
> - #### ID/PW 찾기
>   - ID/PW 찾기
>     - Back
>       1. 입력된 정보 토대로 DB SELECT 쿼리 실행
>       2. 일치 정보 없을 시 문구 VIEW 전송
>       3. 일치 시 결과 페이지 이동 및 SELECT 결과 VIEW단 전송
>       
> - #### 회원가입
>   - 회원가입
>     - Front
>       1. 회원/점주 가입 페이지 구분
>       2. 모든 입력 정보는 정규식으로 입력 제한
>       3. addEventListener("keyup")으로 입력 내용 체크해 정규식 조건 만족시 해당 li의 CSS 변경
> 
>     - Back
>       1. @requestParam이용한 input 정보 획득 
>       2. service 단에서 획득 정보 이용 DB회원테이블 INSERT쿼리 실행
>       
> - #### 식당찾기
>   - 식당 리스트
>     - Front
>       1. 슬라이드.length를 이용한 dot동적 생성 및 좌우버튼 슬라이드
>       2. 예약하기 클릭시 form:hidden value=식당정보 예약하기 페이지에서 JSTL로 받음
>       
>   - 필터  
>     - Front
>       1. 지역 필터 선택시 findIndex((식당리스트) => 식당리스트.name == 필터[i].innerText)로 식당 리스트 내 해당 Index찾기
>       2. Index 기반, lat/lng/지역 추출해 zoom, 식당 리스트, 좌측 상단 제목 변경
>       
>   - 지도
>     - Front
>       1. google.maps.event.addListener("click", function)으로 inform창 띄우기 및 위치 포커스 변경 
>       2. 필터 또는 지역별 식당 통해 얻어진 Index통해 zoom, 리스트, lat, lng 변경
>       
> - #### 예약하기
>   - 예약하기
>     - Front
>       1. 메인페이지 이달의 식당 또는 식당찾기에서 form:hidden value=식당 정보를 JSTL로 받기
>       2. session에서 id, name, contact 가져오기 (id는 DB쿠폰테이블에서 리스트 SELECT 목적)
>       3. new Date()로 현재 날짜, 시간 추려 7~17시 사이이 당일 예약 가능
>       4. 현재시간+3 이후 시간부터 선택 가능
>       5. 예약금 기본 20000원에서 쿠폰 선택시 금액 차감
>       6. max 할인 금액 초과시 max금액 차감 (현재 max 금액 초과 쿠폰 없음)
>       
>     - Back
>       1. session.getAttribute() 통해 로그인 체크 후 예약하기 페이지 접근 가능
>       2. 예약하기 클릭시 예약내역테이블에 고객, 점주, 예약날짜, 예약번호(날짜+연락처+시간) 추가
>       3. DB ROW INSERT 성공시 사용된 쿠폰 있다면 IsExpire = 'Y'처리 및 예약완료 페이지 이동
>       4. 실패 시 예약페이지로 재이동
>       
>   - 예약 확인 및 결제
>     - Front 
>       1. 결제하기 클릭시 i'mport 결제창 팝업
>       2. 팝업시 JSTL로 금액, 회원이름, 식당명 전달
>       3. i'mport 결제 성공시 결제완료 화면 이동
>     
>     - Back
>       1. 결제 완료시 requestParam으로 예약번호 받아 DB 예약테이블 status = '결제완료' UPDATE
>            
> - #### 쿠폰/이벤트
>   - 쿠폰  
>     - Front
>       1. input:hidden value로 쿠폰 정보 제공 
>       2. 식당투표쿠폰
>           + 식당 선택 시 display:none인 input:radio에 담긴 식당 번호 전달
>       3. 레시피쿠폰
>           + 레시피 게시글 클릭시 상세 페이지 이동 없이 diplay:none처리된 tr을 table-row 변경
>           + 게시글 페이징
>             * 게시글VO 생성자 통해 start(첫번째 index)=0, count(페이지당 게시글 수)=5 초기화
>             * 총 게시글 수 이용해 블록 범위, 최초 숫자, 최후 숫자 연산
>             * 연산 숫자 대소 비교해 페이지 블록 또는 페이지 이동 버튼 유무 결정
>             * 페이지 번호 별 a태그 href설정해 페이지 번호 파라미터로 전달 (defaultValue = 1)
>       4. 신규식당쿠폰
>           + 지정 날짜 카운트
>       
>     - Back
>       1. session.getAttribute로 id 뽑아 회원 타입 체크 후 점주 회원 수령 제한
>       2. 프론트에서 받아온 쿠폰, id 정보 controller, service통해 DB 쿠폰 테이블에 INSERT
>       3. 모든 쿠폰은 1회 수령 가능
>       4. 연말쿠폰, 신규식당쿠폰 : 모든 회원 수령 가능
>       5. 신규고객쿠폰       
>           + DB회원테이블 joinDate - new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()) <=30 발급
>       6. 식당투표쿠폰
>           + session.getAttribute에서 id 뽑아 DB투표테이블 내 SELECT 결과 있을 시만 발급
>           + SELECT 결과 있을 시 투표 결과 페이지로만 이동 (투표 1회 가능)
>           + 프론트에서 넘겨진 식당 번호 받아 DB투표테이블 해당 식당 투표수 UPDATE
>       7. 레시피쿠폰
>           + session.getAttribute에서 id 뽑아 DB게시판테이블 내 SELECT 결과 있을 시만 발급
>     
> - #### 마이페이지
>   - 마이페이지 이동
>       - Back
>         1. session.getAttribute()로 id받아 DB거쳐 회원 타입 확인
>         2. 회원 타입 별 마이페이지 PATH 결정
>         
>   - 개인 정보
>       - Front
>         1. DB로부터 가져온 정보 뿌려줌
>         2. '내 정보 수정하기' 클릭시 아이디, 비번 체크 후 수정페이지 이동
>         3. 비밀번호 미개재시 요청 팝업 
>         4. 이메일 중복확인은 회원가입과 동일
>         
>       - Back
>         1. 수정된 내용 DB UPDATE
>         
>   - 쿠폰 내역 : 유저 타입 회원
>       - Front
>         1. DB로부터 가져온 소유 쿠폰 정보 뿌려줌
>         2. 쿠폰 테이블의 IsExpire 컬럼 값에 따라 c:if로 사용완료, 미사용, 기간만료 선택
>         
>   - 내 식당 : 점주 타입 회원
>       - Front
>         1. 이미지 클릭시 이미지 확대 팝업창
>         
>       - Back
>         1. DB식당테이블에서 session 정보 통해 로그인한 점주 식당만 selectList
>         
>   - 예약 보기 : 유저 타입 회원
>       - Front
>         1. 예약 후 미결제 상태일 시, table의 결제 tr에서 재결제 가능
>         2. 결제하기 클릭시 i'moprt 팝업
>         3. DB에서 가져온 예약별 금액, 식당정보, 예약자, 메일 삽입됨 
>         
>       - Back
>         1. 예약하기에서 DB로 INSERT된 ROW중 session정보 이용해 개인 예약 내역만 SELECT
>         2. 결제 완료시 DB예약 테이블 status 컬럼 UPDATE
>         
>    - 예약 보기 : 점주 타입 회원
>       - Back
>         1. DB 예약테이블에서 status컬럼 = 결제완료, session의 id를 조건으로 하는 쿼리 selectList 출력
>         
>   - 문의 내역
>       - Front
>         1. 문의글 클릭시 상세 페이지 이동 없이 diplay:none처리된 tr을 table-row 변경
>         2. session의 id로 id와 일치하는 글만 selectList로 가져와 뿌려줌
>         3. 문의글 작성시 session의 id를 input:text의 value로 주고, readonly 속성 설정해 작성자 고정
>         
>       - Back
>         1. 작성완료 버튼 클릭 시 내용, 제목, 작성자, 구분 카테고리, 작성일 DB INSERT
>         2. 삭제시 DB 문의글테이블의 isdelete = 'Y'처리  

>   - 회원 탈퇴
>       - Front
>         1. 비밀번호 입력시 탈퇴 처리
>         
>       - Back
>         1. DB 회원테이블의 PW컬럼 null처리
>   
> - #### 어드민 페이지
>   - 관리자 및 회원 관리
>       - Front
>         1. DB에서 selectList로 받아온 모든 인원 뿌려주기
>         2. 리셋 : 선택한 인원 정보 아이디 제외 모두 '사용가능'으로 변경됨
>         3. 추가 : 클릭시 1명의 인원 추가 가능 (document.createElement()로 동적 태그 생성)
>         4. 수정 : 선택한 인원의 정보 수정 (document.createElement()로 동적 태그 변경)
>         5. 검색 : addEventListener("keyup")으로 검색어 입력받아 포불포로 tr의 display 결정
>         
>       - Back
>         1. 리셋/수정 : 선택 인원 checkbox의 value=PK 배열 생성 후 ajax POST로 controller로 전달 service 실행해 DB UPDATE
>         2. 추가 : 생성된 태그에 받아진 value를 ajax POST로 controller 전달 service 실행해 DB INSERT 
>     
#
## 🌟To Be
> - - [ ] 게시글 조회수
> - - [ ] 어드민 쿠폰관리
> - - [ ] 어드민 게시글 관리
> - - [ ] 어드민 투표 관리
> - - [ ] 쿠폰 유효기간 만료 처리
> - - [ ] 게시글 작성자 아이디 일부 마스킹
> - - [ ] 레시피 카테고리별 멀티 게시판 + 페이징 
> - - [ ] 신규식당카운트 종료 후 식당 리스트 INSERT 로직
> - - [ ] 마이페이지 프로필 이미지 삽입 & 수정 
> - - [ ] 마이페이지 접근 시 DB 체크 -> 회원 테이블에 회원타입 컬럼 생성해 체크 방법 변경하기
> - - [ ] 회원가입시 구글메일 라이브러리 이용해 인증코드 
> - - [ ] 마이페이지 점주 식당 리스트의 사진 개별 수정 기능
> - - [ ] 회원가입 약관 팝업창 만들기
#
## 📸Demonstration
(이미지 클릭시 유튜브 링크 이동)
> - 웰컴 & 메인 페이지                         
> [![Video Label](http://img.youtube.com/vi/kyLzqz1VxAs/1.jpg)](https://www.youtube.com/watch?v=kyLzqz1VxAs)
> - 소개 페이지                         
> [![Video Label](http://img.youtube.com/vi/BK9_4PD5YDg/1.jpg)](https://www.youtube.com/watch?v=BK9_4PD5YDg)
> - 식당찾기 페이지                         
> [![Video Label](http://img.youtube.com/vi/yGqpRWLtN6c/1.jpg)](https://www.youtube.com/watch?v=yGqpRWLtN6c)
> - 쿠폰/이벤트 페이지                         
> [![Video Label](http://img.youtube.com/vi/T977Tks9Byk/1.jpg)](https://www.youtube.com/watch?v=T977Tks9Byk)
> - 회원가입/로그인                         
> [![Video Label](http://img.youtube.com/vi/6nZbbW5lnRw/1.jpg)](https://www.youtube.com/watch?v=6nZbbW5lnRw)
> - 예약하기                         
> [![Video Label](http://img.youtube.com/vi/zkdukXf_oDA/1.jpg)](https://www.youtube.com/watch?v=zkdukXf_oDA)
> - 마이페이지                               
> [![Video Label](http://img.youtube.com/vi/Nnh0Xd6G99I/1.jpg)](https://www.youtube.com/watch?v=Nnh0Xd6G99I)
> 
> 
> 
# 
## 📑Attached
#### 첨부1        
[250만 비건 인구 잡아라...쏟아지는 비건 식품들](https://www.mk.co.kr/news/business/view/2021/12/1222746/)
        
#### 첨부2        
[지구를 위한 작은 움직임의 시작…‘간헐적 채식’](https://thepublic.kr/news/newsview.php?ncode=1065576144791731)
