# StyleIsYou Shop

이젠 아카데미에서 진행한 팀 프로젝트 입니다.

여성의류 쇼핑몰입니다.



# Description

- 개발 기간: 2020.05.18 ~ 2020.06.17 (약 5주)

- 참여 인원: Backend 4명

- 사용 기술

  - Spring 4.0,  Apache Tomcat 9.0,  Tiles3,  BootStrap,  Mybatis
  - Java,  Ajax,  Jquery,  Git,  MVC Pttern
  - Oracle 11g DataBase

- 담당 구현 파트

  - 프로젝트 개발환경 구축, 설계 참여

  - 메인 페이지 구현

  - Header 메인 메뉴 디자인 및 구성(검색)

  - 상품 카테고리 페이지 구현(상품리스트, 페이징, 검색)

  - 상품 상세페이지 구현 (수량에 따른 가격증가, 좋아요, 장바구니, 

    구매하기, 리뷰, 상품문의)

  - GitHub 레포지토리 전체 관리

  - 팀원들의 Git Conflict 해결

    

# Views

- **메인**

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/stu_main.gif?raw=true"/></p>





- **상품 카테고리** 

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/stu_cate.gif?raw=true"/></p>





- **상품 상세**

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/stu_detail.gif?raw=true"/></p>





# Implementation

- #### 메인화면

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EB%A9%94%EC%9D%B8%ED%99%94%EB%A9%B4.png?raw=true"/></p>

  - **메뉴설정, 상품전체 검색 기능**

    1. Tiles를 이용하여 메인메뉴 전체를 설정.

    2. 검색 시 키워드 또는 상품의 제목을 비교하여 데이터를 가져오고

       JsonView를 설정해 Json형태로 데이터를 가져와 Ajax통신으로

       검색한 목록들을 페이징 처리와 출력.

  - **슬라이드, 상품리스트**

    1. bxSlider를 이용하여 이미지 슬라이더 구성.

    2. JsonView를 설정해 데이터를 Json형태로 가져와 Ajax 통신으로

       메인 상품 리스트 구성.



------



- #### 상품 카테고리

  <img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%ED%99%94%EB%A9%B4.png?raw=true" width="370" /><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%ED%99%94%EB%A9%B42.png?raw=true" width="370"/>

  <img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%ED%99%94%EB%A9%B41.png?raw=true" width="370" />

  

  - **카테고리별 검색, 리스트, 순서, 페이징** 
    1. Mybatis 동적 쿼리문을 이용하여 하나의 쿼리문으로 카테고리별 검색, 리스트, 순서, 페이징을 한 번에 처리를 하고 JsonView를 설정하여 Json형태로   데이터를 가져와 Ajax 통신으로 상품 리스트를 구성합니다

 

------

- #### 상품 상세보기1

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EB%94%94%ED%85%8C%EC%9D%BC1.png?raw=true"/></p>

  - **상품 추가 및 삭제 기능**

    1. Jquery를 사용하여 선택한 상품 추가 및 원하는 상품 삭제 가능.
    2. Jquery를 사용하여 추가한 상품 수량 증가 및 감소 시 가격 실시간 동적 변경.
    3. 중복되는 상품 유효성 체크 완료.

  - **좋아요, 장바구니, 구매하기 기능**

    1. ♥클릭 시 해당 상품을 MyPage 좋아요 게시판에 추가.
    2. 장바구니 클릭 시 선택한 상품이 장바구니 리스트에 등록됩니다. 그리고 팝업창이 뜹니다. 상품을 선택 안 할 시 유효성 체크 완료. 
    3. 구매하기 버튼 클릭 시 해당 상품과 같이 주문페이지로 이동.

  - **Navigation Bar**

    1. Bootstrap을 사용하여 메뉴 바를 구성하였고 버튼 클릭 시 해당 내용으로 이동할 수 있게 메뉴 바를 수정하였습니다. 

  - **상세정보**

    1. CkEditor를 사용하여 상품의 이미지, 내용을 등록시켰습니다. 상세정보에 나오는 이미지와 글씨는 DataBase에 저장된 내용을 그대로 추출하여 사용했습니다. 

       

- #### 상품 상세보기2

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EB%94%94%ED%85%8C%EC%9D%BC2.png?raw=true"/></p>

  - **상품 문의 기능**
    1. JsonView를 설정해 Json형태로 데이터를 가져와 Ajax 통신으로 리스트 구성.
    2. Toggle을 사용하여 제목을 클릭 시 보이기, 숨기기 기능 구성.
  - **Review 기능**
    1. JsonView를 설정해 Json형태로 데이터를 가져와 Ajax 통신으로 리스트 구성.
    2. Toggle을 사용하여 제목을 클릭 시 보이기, 숨기기 기능 구성. 
    3. 리뷰를 등록할 때 CkEditor를 사용하여 DataBase에 저장된 이미지와 내용 출력.
    4. Ajax 및 Jquery로 페이징 구성.

 



- # CRUD

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/crud.png?raw=true"/></p>

  - **상품(리뷰) 등록 및 수정 삭제**
    1. 상품 등록 및 수정 Controller에서 ModelAndView를 사용하여 하나의 Jsp에 상품 등록인지 수정인지 구분할 수 있는 String값을 전송하여 Jstl C태그 조건문을 사용하여 구분하였습니다. 
    2. 상품 삭제 기능은 Delete처리를 하지 않고 DataBase를 설계할 때 상품 테이블에 구분 컬럼을 추가해 Update를 시켜 해당 데이터를 유저들이 보지 못하게 구성해놨습니다(Delete도 가능).
  - **상품(리뷰) 이미지 업로드 및 옵션(컬러, 사이즈) 등록**
    1. 이미지 업로드 Controller를 만들어 이미지를 서버에 저장할 수 있게 구성.
    2. 상품 또는 리뷰를 등록할 때 모든 이미지는 다중 업로드 처리를 했습니다.
    3. 상품 이미지 업로드 시 DataBase 상품 테이블 썸네일 컬럼에 자동으로 썸네일 이미지가 추가 되고 모든 이미지는 Upload 테이블에 추가됩니다.  (Service에서 상품을 등록할 때 모든 처리). 
    4. 상품 옵션은 다중 for문을 이용해 각 컬러, 사이즈마다 하나씩 DataBase에 등록이 됩니다. 





- # Log 설정

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EB%A1%9C%EA%B7%B8%EC%84%A4%EC%A0%95.png?raw=true"/></p>

  - **목적 및 설명**

    1. 어떤 순서로 작업이 진행되고 SQL문을 확인 및 오류는 어디서 발생되는지 확인.

    2. Log4j를 이용하였고 SQL 및 MVC패턴의 흐름을 직접적으로 느낄 수 있게   팀원들에게 제공

       

- # Tiles 설정

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%ED%83%80%EC%9D%BC%EC%A6%88%EC%84%A4%EC%A0%95.png?raw=true"/></p>

  - **목적 및 설명**

    1. 레이아웃의 재사용성 높여주고 동적으로 배치.

    2. Tiles 기본 환경 구성 팀원들에게 제공.

    3. Header에 메인 메뉴를 설정하여 팀원들에게 제공.

       

# Trouble Shooting 

<p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%851.png?raw=true"/></p>

<p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%852.png?raw=true"/></p>



# 스케쥴 및 유즈케이스

<p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%8A%A4%EC%BC%80%EC%A5%B4.png?raw=true"/></p>



<p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%9C%A0%EC%A6%88%EC%BC%80%EC%9D%B4%EC%8A%A4.png?raw=true"/></p>

