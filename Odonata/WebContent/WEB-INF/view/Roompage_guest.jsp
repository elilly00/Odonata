<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Roompage_guest</title>
    <link rel="stylesheet" href="../style/Roompage_guest.css" />
  </head>
  <body>
    <!-- head 시작 -->
    <div class="wrap">
      <div class="main_nav">
        <div class="header">
          <div class="logo">
            <label><a href="index.html">잠자리</a></label>
          </div>

          <ul class="nav">
            <li><a href="mypage.html">마이페이지</a></li>
            <li><a href="#">로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- head 끝 -->
    <!-- body 시작 -->
    <div class="body">
      <div class="name">
        <h1>잠자리 방</h1>
        <p><b>\120,000</b>/박</p>
      </div>
      <!-- 		<div class="section"> 슬라이드 효과 -->
      <!-- 			<input type="radio" name="slide" id="slide01" checked> -->
      <!-- 			<input type="radio" name="slide" id="slide02"> -->
      <!-- 			<input type="radio" name="slide" id="slide03"> -->

      <div class="slidewrap">
        <ul class="slidelist">
          <li>
            <img
              alt="방 사진1"
              src="../images/room1.jpg"
              style="width: 300px; height: 350px"
            />
          </li>
          <li>
            <img
              alt="방 사진2"
              src="../images/room2.jpg"
              style="width: 300px; height: 350px"
            />
          </li>
          <li>
            <img
              alt="방 사진3"
              src="../images/room3.jpg"
              style="width: 300px; height: 350px"
            />
          </li>
        </ul>

        <p class="controller">
          <span class="prev">&lang;</span>
          <!-- 왼쪽 방향 화살표 -->
          <span class="next">&rang;</span>
          <!-- 오른쪽 방향 화살표 -->
        </p>
      </div>
    </div>
    <script>
      let slides = document.querySelector(".slides");
      let slideImg = document.querySelectorAll(".slides li");
      currentIdx = 0;
      slideCount = slideImg.length;
      prev = document.querySelector(".prev");
      next = document.querySelector(".next");

      slideWidth = 300;
      slideMargin = 100;
      slides.style.width = (slideWidth + slideMargin) * slideCount + "px";

      function moveSlide(num) {
        // 왼쪽으로 400px씩 이동
        slides.style.left = -num * 400 + "px";
        currentIdx = num;
      }

      prev.addEventListener("click", function () {
        // 첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해
        // currentIdx !==0일때만 moveSlide 함수 불러옴
        if (currentIdx !== 0) moveSlide(currentIdx - 1);
      });

      next.addEventListener("click", function () {
        // 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해
        // currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴
        if (currentIdx !== slideCount - 1) moveSlide(currentIdx + 1);
      });
    </script>

    <!-- 	</div> -->

    <div>
      <div class="body2">
        <div class="info">
          <h2>잠자리님의 아파트 전체</h2>
          <span>최대 인원 4명</span>

          <br />

          <span>침실 2개</span><span> · </span><span>침대 2개</span
          ><span> · </span><span>욕실 1개</span>

          <br />

          <span>셀프 체크인 가능</span>
        </div>
      </div>
    </div>
    <div class="body3">
      <h2>숙소 편의 시설</h2>
      <div class="info_a">
        <!-- 가로로 병렬시키기 -->
        <img class="emoji" alt="집" src="../images/home.PNG" />
        <div><b>아파트 전체</b></div>
        <img class="emoji" alt="세탁기" src="../images/washingmachine.PNG" />
        <div><b>세탁기</b></div>
      </div>
      <div class="info_b">
        <img class="emoji" alt="와이파이" src="../images/wifi.PNG" />
        <div><b>와이파이</b></div>
        <img class="emoji" alt="에어컨" src="../images/aircon.PNG" />
        <div><b>에어컨</b></div>
        <img class="emoji" alt="주방" src="../images/kitchen.PNG" />
        <div><b>주방</b></div>
      </div>
    </div>
    <div class="body4">
      <h2>숙소 위치</h2>
      <div>
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13047.664222335108!2d129.1516294393282!3d35.15871422810572!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35688d5c0efe075f%3A0x9963b1d5c163ac98!2z7ZW07Jq064yA7ZW07IiY7JqV7J6l!5e0!3m2!1sko!2skr!4v1635207450799!5m2!1sko!2skr"
          width="700"
          height="300"
          style="border: 0; margin-top: 10px"
          allowfullscreen=""
          loading="lazy"
        ></iframe>
      </div>
    </div>

    <div class="body5">
      <h2>리뷰</h2>
      <span>nn개</span>
      <div class="reviews">
        <div>
          <img class="reviewer" src="../images/man.PNG" />
          <div><b>man1</b></div>
          <pre>2021.4.12</pre>
          <div>너무 깔끔하고 좋았습니다 &nbsp;</div>
        </div>
        <div>
          <img class="reviewer" src="../images/man2.PNG" />
          <div><b>man2</b></div>
          <pre>2021.7.08</pre>
          <div>&nbsp;최고입니다 !!&nbsp;</div>
        </div>
        <div>
          <img class="reviewer" src="../images/woman.PNG" />
          <div><b>woman</b></div>
          <pre>2021.10.16</pre>
          <div>&nbsp;다시 방문하고 싶어요</div>
        </div>
        <!-- <div class="more">후기 더보기</div> -->
      </div>
    </div>
  </body>
</html>
