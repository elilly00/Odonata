<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Search_result</title>
    <style>
      * {
        list-style: none; /* 목록태그 점 없앰 */
        text-decoration: none; /* 글자 밑줄 없앰 */
        border-collapse: collapse;
        margin: 0 auto;
        border: 0px;
        color: black;
      }

      .main_nav {
        width: 100%;
        height: 82px;
      }

      .header {
        display: flex; /* 가로로 정렬 됨 */
        width: 100%;
        margin: 0 auto;
        height: 61px;
        border-radius: 10px;
        background: #d99982;
        box-shadow: 0px 4px 4px lightgray;
      }

      .logo {
        width: 600px;
        height: 61px;
        line-height: 60px;
        margin-left: 40px;
      }

      .location {
        border: none;
        width: 550px;
        height: 35px;
        border-radius: 10px;
        margin: 10px 0px 0px 80px; /* 위 | 오른쪽 | 아래 | 왼쪽 */
        box-shadow: 1px 2px 2px 1px lightgray;
        background: white;
      }

      .location > form > input {
        border: none;
        width: 85px;
        height: 25px;
        background: rgba(0, 0, 0, 0);
        color: black;
        margin: 0 auto;
        display: inline;
      }

      .nav {
        display: flex; /* 가로로 정렬 */
        justify-content: flex-end;
        line-height: 60px;
        width: 900px;
      }

      .nav img {
        width: 70px;
        margin: 15px 30px 0px 500px;
      }
      /* .nav>li{
 		margin-right: 15px;	/* li간 간격 띄여주기 */
      /* color: black; */

      /* header 부분 끝 */
      */ .header2 {
        width: 1300px;
        height: 50px;
        margin-bottom: 20px;
        /*   		border-bottom: 2px solid lightgray;  */
        /*    		background: tomato;  */
      }

      .ft {
        width: 1000px;
        /*  		background: yellow; */
      }

      .button {
        border: none;
        background: white;
        margin: 15px;
        border-radius: 20px;
        width: 100px;
        height: 40px;
        ext-transform: uppercase;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease 0s;
        cursor: pointer;
        outline: none;
      }
      .button:hover {
        background-color: #d99982;
        box-shadow: #d99982;
        color: white;
        transform: translateY(-7px);
      }

      .body {
        margin: 20px;
        widht: 1500px;
        height: 1500px;
        /* 		background: gray; */
      }
      .room_left {
        width: 800px;
        height: 400px;
        float: left;
        margin-left: 30px;
        border-bottom: 1px solid lightgray;
        /*  		background: tomato;  */
      }
      .map_right {
        widht: 400px;
        height: 1000px;
        float: left;
        /* 		background: skyblue; */
      }

      .room {
        border-bottom: 1px solid lightgray;
      }

      .photo {
        margin-top: 20px;
        float: left;
      }

      .info {
        margin: 30px;
        float: left;
      }

      .info > pre {
        margin-bottom: 2px;
      }

      .room_img_input {
        margin: 10px;
        border-radius: 10px;
      }
      .pho {
        vertical-align: middle;
      }

      .info2 {
        margin-left: 250px;
      }
      .on {
        float: left;
        margin-bottom: 50px;
        color: #d99982;
      }
      .map {
        margin-top: 75px;
      }
    </style>
  </head>
  <body>
    <div class="main_nav">
      <div class="header">
        <div class="logo">
          <label
            ><a href="index.html"><b>잠자리</b></a></label
          >
        </div>

        <div class="nav">
          <div class="img">
            <!-- 					<button type="button" class="btn_image" id="btn_img" > -->
            <img
              src="../images/profile.png"
              style="margin-left: 900px; width: 35px; height: 35px"
            />
            <!-- 					</button> -->
            <!-- 				<li><a href="#">마이페이지</a></li> -->
            <!-- 				<li><a href="#">로그아웃</a></li> -->
          </div>
        </div>
      </div>
    </div>
    <div class="header2">
      <div class="ft">
        <ul class="filter">
          <li>
            <select class="button">
              <option>숙소 유형</option>
              <option>아파트</option>
              <option>주택</option>
              <option>별채</option>
              <option>게스트하우스</option>
            </select>
            <button class="button">요금</button>
            <button class="button">주방</button>
            <button class="button">에어컨</button>
            <button class="button">세탁기</button>
            <button class="button">무료 주차장</button>
            <button class="button">조식</button>
          </li>
        </ul>
      </div>
    </div>

    <div class="body">
      <div class="room_left">
        <div class="room">
          <p>00월 00일 - 00월 00일 . 게스트 2명</p>
          <h2>부산에서 위치한 숙소입니다.</h2>
          <br />
        </div>

        <div class="photo">
          <img
            class="room_img_input"
            alt="방 사진1"
            src="../images/room1.png"
            width="250"
            height="250"
          />
        </div>
        <div class="info">
          <pre>호스트명</pre>
          <span><b>잠자리</b></span>

          <br />

          <span>아파트 전체</span>

          <br />

          <span>최대 인원 N명</span>

          <br />

          <span>침실 1개</span><span> · </span> <span>침대 2개</span
          ><span> · </span><span>욕실 1개</span>

          <br />

          <span>무료 주차 공간</span><span> · </span><span>에어컨</span
          ><span> · </span><span>무료 인터넷</span>

          <div class="info2">
            <h3>\ 50,000 / 박</h3>
          </div>
          <div>
            <span>총액 \ 100,000</span>
            <p class="star_rating"><br /><a href="#" class="on">⭐ 4.8</a></p>
          </div>
        </div>
      </div>
      <div class="map_right">
        <div class="map">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13047.664222335108!2d129.1516294393282!3d35.15871422810572!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35688d5c0efe075f%3A0x9963b1d5c163ac98!2z7ZW07Jq064yA7ZW07IiY7JqV7J6l!5e0!3m2!1sko!2skr!4v1635207450799!5m2!1sko!2skr"
            width="800px"
            height="700px;"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
          ></iframe>
        </div>
      </div>
      <!-- <div class="room_left2">
			<div class="photo2">
				<img class="room_img_input" alt="방 사진1" src="./images/room2.png" width="250" height="250">
			</div>
			<div class="info3">
				<pre>호스트명</pre>
				<span><b>잠자리</b></span>
				
				<br>
				
				<span>아파트 전체</span>
				
				<br>
				
				<span>최대 인원 N명</span>
				
				<br>
				
				<span>침실 1개</span><span> · </span>
				<span>침대 2개</span><span> · </span><span>욕실 1개</span>
				
				<br>
				
				<span>무료 주차 공간</span><span> · </span><span>에어컨</span><span> · </span><span>무료 인터넷</span>
			
			<div class="info4">
				<h3>\ 50,000 / 박</h3>
			</div>
			<div>
				<span>총액 \ 100,000</span>
				<p class="star_rating">
				<br><a href="#" class="on">⭐ 4.8</a>
			</div>
			</div>
		</div> -->
    </div>
  </body>
</html>
