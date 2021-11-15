<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Roompage1</title>
    <style>
      /* 초기화 */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        list-style: none;
        text-decoration: none;
        color: black;
      }
      .main_nav {
        width: 100%;
        height: 100%;
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

      .location_i {
        width: 800px;
        height: 61px;
        margin: 3px;
      }
      #in_sar {
        width: 100px;
        background: transparent; /* 투명 */
        border: none;
        margin-left: 10px;
      }
      #in {
        background: transparent;
        border: none;
        margin-left: 10px;
      }

      .nav img {
        width: 70px;
        margin: 15px 30px 0px 500px;
      }
      /*  	.nav >li{margin-left: 10px;} */

      .body {
        text-align: center;
        margin: 10px;
        padding: 10px;
        position: relative;
      }

      /* 보여줄 구간의 높이와 넓이 설정 */
      #slideShow {
        width: 500px;
        height: 300px;
        position: relative;
        margin: 50px auto;
        overflow: hidden;
        background: white;
        /*리스트 형식으로 이미지를 일렬로 정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은 hidden으로 숨겨줘야됨*/
      }

      .slides {
        position: absolute;
        left: 100px;
        right: 100px;
        top: 0;
        width: 200px;
        /* 슬라이드할 사진과 마진 총 넓이 */
        transition: left 1s ease-out;
        /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
      }

      /* 첫 번째 슬라이드 가운데에 정렬하기위해 첫번째 슬라이드만 margin-left조정 */
      .slides li:first-child {
        margin-left: 100px;
      }

      /* 슬라이드들 옆으로 정렬 */
      .slides li:not(:last-child) {
        float: left;
        margin-right: 100px;
      }

      .slides li {
        float: left;
      }

      .controller span {
        position: absolute;
        background-color: transparent;
        color: black;
        text-align: center;
        border-radius: 50%;
        padding: 10px 20px;
        top: 50%;
        font-size: 1.3em;
        cursor: pointer;
      }

      /* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
      .controller span:hover {
        background-color: rgba(128, 128, 128, 0.11);
      }
      .prev {
        left: 10px;
      }

      /* 이전 화살표에 마우스 커서가 올라가 있을때 이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
      .prev:hover {
        transform: translateX(-10px);
      }
      .next {
        right: 10px;
      }

      /* 다음 화살표에 마우스 커서가 올라가 있을때 이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
      .next:hover {
        transform: translateX(10px);
      }

      .body {
        width: 1500px;
        margin: 0 auto;
        border-bottom: 1px solid lightgray;
      }
      .i {
        margin-left: 150px;
      }
      .body0 {
        float: left;
        width: 700px;
        margin: 70px;
        border: 1px solid lightgray;
        border-radius: 10px;
        box-shadow: 1px 2px 2px 1px lightgray;
      }
      .body1 {
        text-align: cneter;
      }
      .info,
      .body2,
      .body3,
      .body4 {
        width: 700px;
        margin: 0 auto;
        padding: 11px;
        border-bottom: 1px solid lightgray;
        text-align: center;
      }

      .body2 > h2 {
        height: 50px;
        margin-top: 10px;
      }
      .emoji {
        width: 24px;
        height: 24px;
        padding: 2px;
      }
      .reviews {
        display: flex;
        margin-left: 70px;
        padding: 10px;
      }
      .reviewer {
        width: 40px;
        height: 40px;
        border-radius: 30px;
      }

      .more {
        margin-top: 65px;
        margin-left: 50px;
        width: 100px;
        height: 30px;
        background-color: white;
        color: black;
        border: 1px solid gray;
        text-align: center; /* 글자 위치 : 가운데 */
        line-height: 30px; /* 글자 높이  */
        cursor: pointer;
        border-radius: 10px;
      }

      .submit {
        margin: 30px;
      }

      #submit {
        width: 100px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
      }

      .right {
        position: sticky;
        display: flex;
        margin-top: 70px;
        float: left;
        height: 40px;
      }
      .wrap {
        width: 500px;
        height: 450px;
        text-align: center;
        border: 1px solid lightgray;
        border-radius: 10px;
        box-shadow: 1px 2px 2px 1px lightgray;
      }

      .date {
        margin-top: 150px;
        height: 30px;
      }

      .select {
        margin-top: 10px;
        height: 30px;
      }

      .button {
        margin-top: 50px;
      }
      .button2 {
        background: #74788c;
        border: none;
        border-radius: 10px;
        width: 200px;
        height: 40px;
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
              style="margin-left: 850px; width: 35px; height: 35px"
            />
            <!-- 					</button> -->
            <!-- 				<li><a href="#">마이페이지</a></li> -->
            <!-- 				<li><a href="#">로그아웃</a></li> -->
          </div>
        </div>
      </div>
    </div>
    <div class="body">
      <div class="name">
        <h1>잠자리 방</h1>
        <p><b>\120,000</b>/박</p>
      </div>
    </div>
    <div id="slideShow">
      <!-- 첫 사진이 제대로 안나옴.. -->
      <ul class="slides">
        <li><img src="../images/room1.png" alt="" /></li>
        <li><img src="../images/room2.png" alt="" /></li>
        <li><img src="../images/room3.png" alt="" /></li>
      </ul>

      <p class="controller">
        <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
        <span class="prev">&lang;</span>
        <span class="next">&rang;</span>
      </p>
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
    <div class="i">
      <div class="body0">
        <div class="body1">
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
        <div class="body2">
          <h2>숙소 편의 시설</h2>
          <div class="info_a">
            <!-- 가로로 병렬시키기 -->
            <img class="emoji" alt="집" src="../images/home.PNG" />
            <div><b>아파트 전체</b></div>
            <img
              class="emoji"
              alt="세탁기"
              src="../images/washingmachine.PNG"
            />
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
        <div class="body3">
          <h2>숙소 위치</h2>
          <div>
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13047.664222335108!2d129.1516294393282!3d35.15871422810572!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35688d5c0efe075f%3A0x9963b1d5c163ac98!2z7ZW07Jq064yA7ZW07IiY7JqV7J6l!5e0!3m2!1sko!2skr!4v1635207450799!5m2!1sko!2skr"
              width="600"
              height="300"
              style="border: 0; margin-top: 10px"
              allowfullscreen=""
              loading="lazy"
            ></iframe>
          </div>
        </div>

        <div class="body4">
          <h2>리뷰</h2>
          <span>nn개</span>
          <div class="reviews">
            <div>
              <img class="reviewer" src="../images/man.PNG" />
              <div><b>룰루</b></div>
              <pre>2021.4.12</pre>
              <div>너무 깔끔하고 좋았습니다 &nbsp;</div>
            </div>
            <div>
              <img class="reviewer" src="../images/man2.PNG" />
              <div><b>랄라</b></div>
              <pre>2021.7.08</pre>
              <div>&nbsp;최고입니다 !!&nbsp;</div>
            </div>
            <div>
              <img class="reviewer" src="../images/woman.PNG" />
              <div><b>릴리</b></div>
              <pre>2021.10.16</pre>
              <div>&nbsp;다시 방문하고 싶어요</div>
            </div>
            <div class="more">후기 더보기</div>
          </div>
          <div class="submit">
            <input type="submit" id="submit" value="보내기" />
          </div>
        </div>
      </div>
      <div class="right">
        <div class="wrap">
          <div class="date">
            <input type="text" placeholder="체크인 날짜" size="20" />
            <input type="text" placeholder="체크인 날짜" size="20" />
          </div>
          <div class="select">
            <select class="select2">
              <option>인원 추가</option>
              <option value="1">1명</option>
              <option value="2">2명</option>
              <option value="3">3명</option>
              <option value="4">4명</option>
              <option value="5">5명</option>
              <option value="6">6명</option>
              <option value="7">7명</option>
              <option value="8">8명</option>
              <option value="9">9명</option>
              <option value="10">10명</option>
            </select>
          </div>
          <div class="button">
            <button class="button2">예약 가능 여부 확인 / 예약 확인</button>
          </div>

          <br />

          <div><span>\ 50,000 X 3박 </span> <span>\ 150,00</span></div>
          <div>
            <span><b>총 합계</b></span>
            <span>\ 150,000</span>
          </div>
        </div>
      </div>
    </div>

    <!--  <footer>
    <div>
      <section class="footerul2">
        <div>
          <a><i class="fas fa-globe"></i> 한국어 KR</a>
          <a><i class="fas fa-won-sign"></i> KRW</a>
        </div>
        <ul class="footerul">
          <li><i class="fab fa-facebook-f"></i></li>
          <li><i class="fab fa-twitter-square"></i></li>
          <li><i class="fab fa-instagram"></i></li>
          <li><i class="fas fa-blog"></i></li>
          <li><i class="fas fa-pencil-alt"></i></li>
        </ul>
      </section>
      <section class="footerul3">
        <div>
          <div class="copyright">
            <a>© 2021 잠자리, Inc.</a>
          </div>
          <div class="footermenu">
            <a>개인정보 처리방침</a>
            <a>·</a>
            <a>이용약관</a>
            <a>·</a>
            <a>사이트맵</a>
            <a>·</a>
            <a>한국의 변경된 환불 정책</a>
            <a>·</a>
            <a>회사 세부정보</a>
          </div>
        </div>
      </section>
    </div>
  </footer> -->
  </body>
</html>
