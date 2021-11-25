<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="user.model.vo.User, 
				reserv.model.vo.Reserv, 
				rooms.model.vo.Rooms, 
				payment.model.vo.Payment" 
%>

<%
	// Reserv: 체크인, 체크아웃, 인원 수, 가격  | Rooms : 숙소이름
	User loginUser = (User)session.getAttribute("loginUser");
	Reserv r = (Reserv)request.getAttribute("reserv");
	//// Rooms에서 숙소이름 받아와야함
	Rooms room = (Rooms)request.getAttribute("rooms");
	Payment p = (Payment)request.getAttribute("payment");
%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>payment_finished</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/Payment_finished.css" />


</head>

<body>
  <nav class="main-navi">
    <a class="logoo" href="<%= request.getContextPath() %>/WEB-INF/index.jsp">
      <img class="logoo" src="<%= request.getContextPath() %>/img/logo.png">
    </a>
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
      <div class="item menusolo">
      </div>
      <div class="button" type="button" onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">
        <img class="profile" src="<%= request.getContextPath() %>/img/public_img/profile.png" alt="마이페이지"
          id="profile" />
      </div>
      <% } %>
    </div>
  </nav>

  <div class="main-page">
    <div class="login-form">
      <form id="loginForm" method="post">
      </form>
      <h2 id="couponTitle"></h2>
      </nav>
      <div class="content">

        <h3 class="title1">결제가 정상적으로 완료되었습니다.</h3>

        <div>
          <h4>결제 정보</h4>
          <div class="title5">
            <div class="title6">
              <h5>예약 날짜: <%= r.getCheck_in() %> - <%= r.getCheck_out() %></h5>
              <h5>숙소 이름 : <%= room.getRooms_name() %></h5>
              <h5>인원 : <%= r.getPersonnel() %></h5>

              <hr>
              <hr>
              <h5>총 금액 : <%= r.getReserv_Price() %></h5>
            </div>

          </div>
        </div>

      </div>