<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User" %>
<%
  User loginUser = (User)session.getAttribute("loginUser");
%>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>


  <link rel="shortcut icon" href="../img/airbnb.ico" type="image/x-icon" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/navi.css" />

  <title>마이페이지</title>

  <style>
    /* html, body {
      height: 100%;
      width: 100%;
    } */
    #history,
    #reserve {
      background: lightgray;
      height: 250px;
    }

    #historyTB,
    #logTB {
      width: 100%;
    }
  </style>
</head>

<body>
  <nav class="main-navi" style="background: #f2bba7;">
    <a href="<%= request.getContextPath() %>/WEB-INF/index.html">
      <div class="logo">
        <img src="<%= request.getContextPath() %>/img/public_img/logo.png" width="80px" height="80px" alt="잠자리"
          class="mx-2" />
      </div>
    </a>

    <div class="menu">
      <button type="button" onclick="location.href='login.html'" class="item menusolo hostdg">
        로그인/회원가입
      </button>
      <div class="item menusolo">
      </div>
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
    </div>

  </nav>

  <div class="container-fluid">

    <div class="row mx-auto my-4">
      <div class="col px-5">
        <h2>과거 내역</h2>
      </div>
    </div>

    <div class="row mx-auto my-2">
      <div class="col px-5 mx-5" id="history">

        <!-- 과거 내역 표 형태 예시 -->
        <table class="table table-border table-hover" id="historyTB">
          <thead>
            <tr>
              <th>No.</th>
              <th>호스트</th>
              <th>여행 일자</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>KH</td>
              <td>2021.10.25.</td>
              <td>완료</td>
            </tr>
            <tr>
              <td>2</td>
              <td>KH</td>
              <td>2021.10.22.</td>
              <td>취소</td>
            </tr>
          </tbody>
        </table>

      </div>
    </div>

    <div class="row mx-auto my-4">
      <div class="col px-5">
        <h2>예약 내역</h2>
      </div>
    </div>

    <div class="row mx-auto my-2 mb-5">
      <div class="col px-5 mx-5" id="reserve">

        <!-- 예약 내역 표 형태 예시 -->
        <table class="table table-border table-hover" id="logTB">
          <thead>
            <tr>
              <th>No.</th>
              <th>호스트</th>
              <th>여행 일자</th>
              <th>예약 접수 일자</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>KH</td>
              <td>2021.10.25. ~ 10.27.</td>
              <td>2021.10.17.</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>2</td>
              <td>KH</td>
              <td>2021.10.22. ~ 10.24.</td>
              <td>2021.10.13.</td>
              <td>취소</td>
            </tr>
          </tbody>
        </table>

      </div>
    </div>

    <!-- <button type="button" class="btn btn-secondary btn-lg btn-block mx-5">개인 정보 변경</button> -->
    <!-- <button type="button" class="btn btn-secondary btn-lg btn-block mx-5">쪽지함</button>
    <button type="button" class="btn btn-secondary btn-lg btn-block mx-5">결제 수단 관리</button>
    <button type="button" class="btn btn-secondary btn-lg btn-block mx-5">호스트 숙소 등록</button> -->

  </div>
</body>

</html>