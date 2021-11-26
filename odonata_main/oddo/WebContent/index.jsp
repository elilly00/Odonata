<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="user.model.vo.User" %>
<%
  User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>잠자리: 휴가용 임대 숙소, 통나무집, 비치 하우스, 독특한 숙소 및 체험</title>

  <!-- 폰트어썸 라이브러리 CDNJS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />

  <script src="https://ajax.googleapis.com/ajax/libs/cesiumjs/1.78/Build/Cesium/Cesium.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/WEB-INF/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/WEB-INF/js/jquery.fullPage.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/WEB-INF/js/jquery-3.6.0.min.js"></script>
</head>
<header id="main-page">
  <!-- 네비메뉴 -->
  <nav class="main-navi">
    <div class="logo">
      <!-- <i class="fab fa-airbnb"></i> 잠자리 -->
      <a href="<%= request.getContextPath() %>/WEB-INF/index.jsp">
        <img class="main-navi" src="<%= request.getContextPath() %>/img/public_img/logo.png"
          href="<%= request.getContextPath() %>/WEB-INF/index.jsp">
      </a>
    </div>
    <%-- 검색 폼 시작 --%>
    <form id="loginForm" action="<%=request.getContextPath()%>/list.re" method="post">
      <div class="searching_box">
        <div class="searching_box_inner">
          <div class="location">
            <p>위치</p>
          </div>
          <div class="location_input">
            <input id="inputLocalizacao" type="text" class="dropdown-toggle" autocomplete="off" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="true" placeholder="도시 또는 지역을 입력하세요."></input>
          </div>
          <div class="checkin">
            <p>체크인/체크아웃</p>
          </div>
          <div id="demo">
            <input type="text" class="datePicker" placeholder="체크인/체크아웃 날자를 선택" id="datePicker" readonly>
            <span id="calendar"></span>
          </div>

          <script src="<%= request.getContextPath() %>/js/calendar.js"></script>
          <script>
            var trigger = document.querySelector('#datePicker');
            var dateComponent = new DatePicker({
              el: document.querySelector('#calendar'),
              trigger: trigger,
              onchange: function (curr) {
                trigger.value = curr;
              }
            });

            trigger.onfocus = function () {
              dateComponent.show();
            };
          </script>
          <div class="peoplenum">
            <p>인원 - 성인 / 유아</p>
          </div>

          <div class="peoplenum_input">
            <select class="input_box">
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
            <select class="input_box">
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
          <div class="search_button">
            <a class="search_button_a" >
            <input type="submit" value="검색" class="submit-btn" />
              <%-- <button class="search_img" onclick="location.href='<%= request.getContextPath() %>/list.re'"  type="button"
                src="<%= request.getContextPath() %>/img/public_img/search.png">
                <img class="search_img" src="<%= request.getContextPath() %>/img/public_img/search.png" />
              </button> --%>
            </a>
          </div>
        </div>
      </div>
    </form>
    <%-- 검색 폼 끝 --%>

    <div class="menu">
      <% if(loginUser == null) { %>
      <button type="button" onclick="location.href='<%= request.getContextPath() %>/loginForm.us'"
        class="item menusolo hostdg">
        로그인/회원가입
      </button>
      <% } else { %>
      <div id="userInfo" align="right">
        <%-- <label> <%= loginUser.getUser_name() %> 님의 방문을 환영합니다. </label>
        <br clear="all"> --%>
        <div class="menu">
          <%-- <input type="button" class="item menusolo hostdg" value="내 정보 보기" onclick="location.href='<%= request.getContextPath() %>/myPage.me'">
          --%>
          <input type="button" class="item menusolo hostdg" value="로그 아웃"
            onclick="location.href='<%= request.getContextPath() %>/logout.me'">
        </div>
      </div>
      <div class="button" type="button" onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">
        <img class="profile" src="<%= request.getContextPath() %>/img/public_img/profile.png" alt="마이페이지"
          id="profile" />
      </div>
      <% } %>
    </div>
  </nav>
  <!-- 글자박스 -->
  <div class="box">
    <h1>슬기로운<br />잠자리 생활</h1>
    <p>잠자리가 엄선한<br />위시리스트를 만나보세요.</p>
    <button>잠자리 아이디어 얻기</button>
  </div>
</header>
<!-- 첫페이지 끝 -->

<!-- 둘러보기 섹션 -->
<section id="hostbox">
  <div>
    <h1>숙소를<br />등록해보세요.</h1>
    <p>
      숙소를 등록하여 부수입을 올리고 새로운<br />
      가능성을 만나세요.
    </p>
    <%-- <a href="<%= request.getContextPath() %>/WEB-INF/view/rooms/Registration.jsp">
    <button type="button">숙소 등록하기</button>
    </a> --%>
  </div>
</section>

<!-- <section id="around">
    <h1>가까운 여행지 둘러보기</h1>
    <div class="grid">
      <div class="item">
        <img src="img/1.webp" alt="" />
        <div><strong>서울</strong><br />차로 5시간 거리</div>
      </div>
      <div class="item">
        <img src="img/2.webp" alt="" />
        <div><strong>대구</strong><br />차로 1.5시간 거리</div>
      </div>
      <div class="item">
        <img src="img/3.webp" alt="" />
        <div><strong>울산</strong><br />차로 45분 거리</div>
      </div>
      <div class="item">
        <img src="img/4.webp" alt="" />
        <div><strong>대전</strong><br />차로 3.5시간 거리</div>
      </div>
      <div class="item">
        <img src="img/5.jpg" alt="" />
        <div><strong>광주</strong><br />차로 3.5시간 거리</div>
      </div>
      <div class="item">
        <img src="img/6.webp" alt="" />
        <div><strong>인천</strong><br />차로 5시간 거리</div>
      </div>
      <div class="item">
        <img src="img/7.jpg" alt="" />
        <div><strong>의정부시</strong><br />차로 5시간 거리</div>
      </div>
      <div class="item">
        <img src="img/8.webp" alt="" />
        <div><strong>청주시</strong><br />차로 3.5시간 거리</div>
      </div>
    </div>
  </section> -->

<!-- 둘러보기 섹션 끝 -->
<!-- 살아보기 섹션 -->
<section id="live">
  <h1>어디에서나, 여행은 살아보는 거야!</h1>
  <div class="grid">
    <div class="item">
      <img src="<%= request.getContextPath() %>/img/public_file/main/11.webp" alt="" />
      <div>자연생활을 만끽할 수 있는 숙소</div>
    </div>
    <div class="item">
      <img src="<%= request.getContextPath() %>/img/public_file/main/12.webp" alt="" />
      <div>독특한 공간</div>
    </div>
    <div class="item">
      <img src="<%= request.getContextPath() %>/img/public_file/main/13.webp" alt="" />
      <div>집 전체</div>
    </div>
    <div class="item">
      <img src="<%= request.getContextPath() %>/img/public_file/main/14.webp" alt="" />
      <div>반려동물 동반 가능</div>
    </div>
  </div>
</section>
<!-- 살아보기 섹션 끝 -->
<!-- 호스트가 되어보세요 글자박스 -->
<!-- <div class="hostbox1">
        <h1>호스트가<br>되어보세요</h1>
        <p>숙소를 공유하여 부수입을 올리고 새로운</p>
        <p>가능성을 만나세요.</p>
        <button>자세히 알아보기</button>
    </div> -->

<!-- 호스트가 되어보세요 글자박스 끝 -->
<!-- footer 태그 -->
<footer>
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
          <a>© 2021 odonata</a>
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
</footer>

<body></body>

</html>