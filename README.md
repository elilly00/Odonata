# Semi Project [잠자리]
<br>

## 🔎 바로가기
1. [프로젝트 개요](https://github.com/elilly00/Odonata#1-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EA%B0%9C%EC%9A%94) <br>
2. [프로젝트 기간](https://github.com/elilly00/Odonata#2-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EA%B8%B0%EA%B0%84) <br>
3. [UI Prototype](https://github.com/elilly00/Odonata#3-ui-prototype) <br>
4. [프로젝트 산출물](https://github.com/elilly00/Odonata#4-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%82%B0%EC%B6%9C%EB%AC%BC) <br>
5. [주요 기능](https://github.com/elilly00/Odonata#5-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5) <br>
6. [구현 기능](https://github.com/elilly00/Odonata#6-%EA%B5%AC%ED%98%84-%EA%B8%B0%EB%8A%A5) <br>
7. [개발환경](https://github.com/elilly00/Odonata#7-%EA%B0%9C%EB%B0%9C%ED%99%98%EA%B2%BD) <br>
8. [결과물](https://github.com/elilly00/Odonata#8-%EA%B2%B0%EA%B3%BC%EB%AC%BC)
<br><br>

## 1. 프로젝트 개요
> '잠자리'는 국내 시장을 기반으로 한 개인과 개인간의 숙소 예약 사이트입니다. <br> 
코로나19의 영향으로 해외 여행 수요가 감소됨과 동시에 국내 여행 수요가 증가하였습니다. <br> 
기존 플랫폼인 에어비앤비의 약점을 보완하여 국내 지역 숙소 정보, 정확한 위치 정보, <br> 
사용자가 원하는 선별적인 정보를 제공하는 숙박 예약 사이트를 만들어 보고자 기획하게 되었습니다.
<br>

## 2. 프로젝트 기간
2021.10.18 - 2021.11.15

<br>

## 3. UI Prototype
Kakao Oven을 이용해 UI 프로토타입을 만들었습니다.<br>
[:floppy_disk:.pdf](https://github.com/Cwonseok/Odonata/files/7986646/UI.Prototype.pdf)

<br>

## 4. 프로젝트 산출물
### DB ERD
![잠자리ERD](https://user-images.githubusercontent.com/90914001/152160371-dd5a336b-6e87-4ec2-9ee8-927770c44c89.png)
### UseCase Diagram
![UseCase](https://user-images.githubusercontent.com/90914001/161914415-dd4857c1-5cf8-4465-aaa4-2104b4e2c61e.PNG)

<br>

## 5. 주요 기능
### 회원
- 로그인
- 회원가입
- 내 정보 조회 & 수정
- 비밀번호 변경
- 쪽지 목록 조회
- 쪽지 전송 & 삭제
- 과거 예약 내역
- 회원 탈퇴

### 숙소
- 숙소 등록
- 숙소 목록 조회
- 상세 정보 조회
- 숙소 예약

## 6. 구현 기능
### 숙소
- 숙소 등록
- 숙소 목록 조회
- 상세 정보 조회
- 숙소 예약

<br>

## 7. 개발환경
```
OS : Window 10, iOS
Server : Tomcat 9.0.54
DataBase : Oracle 18c
FrameWork : Bootstrap
Development Language : JAVA, HTML5, CSS3, JavaScript, jQuery, SQL, JSP, Servlet
Development Tool : Eclipse 4.15.0, sqlDeveloper version 21.2.1, Visual Studio code
Team Coop : Github, ERDCloud, kakaoOven, Star UML
Open API : Google Map API, Import API 
```

<br>

## 8. 결과물
### 숙소 등록
![숙소 등록1](https://user-images.githubusercontent.com/90914001/176836593-fa22fb95-b14a-4264-89fd-02365298264b.PNG)
![숙소 등록2](https://user-images.githubusercontent.com/90914001/176836608-1d2e85ef-80c0-499a-9ecf-2018769aa06e.PNG)
![숙소 등록3](https://user-images.githubusercontent.com/90914001/176836614-0bec7d64-753a-4e3d-a732-484a71d5c8dd.PNG)

## 숙소 목록
![숙소 목록1](https://user-images.githubusercontent.com/90914001/176836702-a73dcebf-2b0b-4890-ab08-164dc230265d.PNG)

지도를 통해 숙소 위치를 조회할 수 있다. 
지도의 마킹표시를 클릭하면 해당 위치의 숙소 이름이 띄워진다.

## 상세 정보
![숙소 상세](https://user-images.githubusercontent.com/90914001/176836728-8fa0ed49-2da3-4f54-8a4d-2980018ee81c.PNG)

상세 정보 페이지 상단에 숙소 이미지를 슬라이드하여 볼 수 있다.

![숙소 상세2](https://user-images.githubusercontent.com/90914001/176836734-427569d8-3f7f-4a42-8d82-92282229986f.PNG)

상세 정보 페이지에서 바로 호스트에서 쪽지를 보내거나 숙소를 예약할 수 있다.
