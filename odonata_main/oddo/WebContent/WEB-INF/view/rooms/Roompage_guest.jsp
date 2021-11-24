<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ 
	page import="java.util.ArrayList"  
	import="user.model.vo.*, rooms.model.vo.*,   
			reserv.model.vo.*, sooksoimg.model.vo.*, review.model.vo.*" %>
<% 
	User loginUser = (User)session.getAttribute("loginUser");
	Rooms room = (Rooms)request.getAttribute("room");
	reserv r = (reserv)request.getAttribute("r");
	ArrayList<sooksoImg> ImgList = (ArrayList<sooksoImg>)request.getAttribute("ImgList");
	review review = (review)request.getAttribute("reivew");
%>
<%@ page import="user.model.vo.User" %>
<%
  User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Roompage_guest</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style/Roompage_guest.css" />
  </head>
  <body>
    <div class="header">
      <div class="logo">
        <label>
          <a href="../index.html">
            <img src="<%= request.getContextPath() %>/img/public_img/logo.png" alt="메인페이지" id="logo" />
          </a>
        </label>
      </div>
      <div class="menu">
      <% if(loginUser == null) { %>
      <button type="button" onclick="location.href='<%= request.getContextPath() %>/loginForm.us'" class="item menusolo hostdg">
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
      <div class="item menusolo">
        <!-- <i class="fas fa-globe"></i> -->
      </div>
      <div class="item menuset">
        <button class="mypage" type="button" onclick="location.href='<%= request.getContextPath() %>/myPage.me'" class="item menusolo hostdg">
          <!-- <i class="fas fa-bars"></i> -->
          <a href="<%= request.getContextPath()%>/view/user/user_my_page.jsp">
            <i class="fas fa-user-circle"></i>
          </a>

          <% } %>
        </button>
      </div>
    </div>
    </div>

    <div class="body">
      <div class="name">
        <h1><%= r.getRoom_name() %></h1>
        <p><b>\<%= room.getRooms_Price() %></b>/박</p>
      </div>
    </div>
    <div id="slideShow">
      <!-- 첫 사진이 제대로 안나옴.. -->
      <ul class="slides">
        <li><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ImgList.get(0).getChange_name() %>" alt="방사진1" /></li>
        <li><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ImgList.get(1).getChange_name() %>" alt="방사진2" /></li>
        <li><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ImgList.get(1).getChange_name() %>" alt="방사진3" /></li>
      	<li><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ImgList.get(1).getChange_name() %>" alt="방사진4" /></li>
      </ul>

      <p class="controller">
        <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
        <span class="prev">&lang;</span>
        <span class="next">&rang;</span>
      </p>
    </div>
    <div class="body1">
      <div class="body1_1">
        <div class="body1_2">
          <div class="body_info">
            <h2><%= room.getRooms_Host() %>님의 <%= room.getRooms_Type() %></h2>

            <br />

            <span>최대 인원 <%= room.getRooms_Personnel() %>명</span>

            <br />

            <span>침실 <%= room.getRooms_RoomCnt() %>개</span><span> · </span><span>욕실 <%= room.getRooms_ToiletCnt() %>개</span>

            <br />

            <span>동물 동반 가능 '<%= room.getRooms_DogAvail() %>'</span>
          </div>
        </div>
        <div class="body_info2">
          <h2>숙소 편의 시설</h2>
          <div class="info_a">
            
            <%= room.getAmenity() %>

            <!-- 가로로 병렬시키기 -->
            <!-- <img class="emoji" alt="집" src="<%= request.getContextPath() %>/img/public_file/room/home.png" />
            <div><b>아파트 전체</b></div>
            <img
              class="emoji"
              alt="세탁기"
              src="../images/washingmachine.PNG"
            />
            <div><b>세탁기</b></div>
          </div>
          <div class="info_b">
            <img class="emoji" alt="와이파이" src="<%= request.getContextPath() %>/img/public_file/room/wifi.png" />
            <div><b>와이파이</b></div>
            <img class="emoji" alt="에어컨" src="<%= request.getContextPath() %>/img/public_file/room/aircon.png" />
            <div><b>에어컨</b></div>
            <img class="emoji" alt="주방" src="<%= request.getContextPath() %>/img/public_file/room/kitchen.png" />
            <div><b>주방</b></div>
          </div> -->
        </div>
        <div class="body_info3">
          <h2>숙소 위치</h2>
          <br />
          <div id="map"></div> 
        </div>

        <div class="body_info4">
          <h2>리뷰</h2>
          <p>nn개</p>
          <div class="reviews">
            <div>
              <img class="reviewer" src="<%= request.getContextPath() %>/img/public_file/room/man.png" />
              <div><b><%= loginUser.getUser_name() %></b></div>
              <pre><%= review.getR_update() %></pre>
              <div><%= review.getR_content() %></div>
            </div>
            <div>
              <img class="reviewer" src="<%= request.getContextPath() %>/img/public_file/room/man2.png" />
              <div><b><%= loginUser.getUser_name() %></b></div>
              <pre><%= review.getR_update() %></pre>
              <div><%= review.getR_content() %></div>
            </div>
            <div>
              <img class="reviewer" src="<%= request.getContextPath() %>/img/public_file/room/woman.png" />
              <div><b><%= loginUser.getUser_name() %></b></div>
              <pre><%= review.getR_update() %></pre>
              <div><%= review.getR_content() %></div>
            </div>
            <!-- <div class="more">후기 더보기</div> -->
          </div>
        </div>
        <form action="<%= request.getContextPath() %>/msgDetail.ms" method="post"></form>
        <div class="body_info5">
        	<h2>호스트에게 쪽지 보내기</h2>
        	<ul>
            <br>
            <b>제목</b>
            <li>
              <textarea id="title" placeholder="제목 입력" name="title"></textarea>
        		</li>
            <br>
            <b>내용</b>
            <li>
              <textarea id="note" placeholder="호스트에게 쪽지 보내기 / 문의하기" name="text"></textarea>
            </li>  
          </ul>
        </div> 
        <div class="submit">
          <input type="submit" id="submit" value="보내기" />
        </div>
        </form>
      </div>
    </div>
    <form>
      <div class="right">
        <div class="wrap">
          <div class="booking">
            <ul>
              <li>
                <span><b>체크인</b></span>
                <input type="date" class="date" name="checkIn"/>
              </li>
              <li>
                <span><b>체크아웃</b></span>
                <input type="date" class="date" name="chekOut"/>
              </li>
              <li>
                <div class="add">
                  <b>인원 추가</b>
                </div>
                <span class="add2">성인</span>
                <select class="select">
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
                <span class="add3">아동</span>
                <select class="select">
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
              </li>
            </ul>
            <div class="button">
              <input type="submit" class="button2" value="예약하기" onclick="location.href='<%= request.getContextPath() %>/payment.bo'">
            </div>
          </div>

          <br />

          <div class="result">
            <ul>
              <li>
                <span>\ <%= room.getRooms_Price() %> X 3박 </span>
                <br>
              </li>
              <li>
                <span>
                  <b>총 합계</b>
                </span>
                <span>\ 150,000</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </form>

    <script>
      // 사진 슬라이드 설정
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
      
      
      // Google Map 설정 
	    function initMap() {
	
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 15,
            center: { lat: 35.15205551267718, lng: 129.1171569191601 }, 
        });

        for (var i = 0; i < locations.length; i++) {
            var marker = new google.maps.Marker({
                map: map,
                label: locations[i].place,
                position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
            });
        }
      }
          // 장소 마킹
          const locations = [
          { place:"광안리 해수욕장", lat: 35.15317618071567, lng: 129.11867182936666 },
              // { place:"어린이대공원역", lat: 37.547263, lng: 127.074181 },
          ];
	
    </script>
  </body>
</html>
