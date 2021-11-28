<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, user.model.vo.User, reserv.model.vo.Reserv"%>
<%
  User loginUser = (User)session.getAttribute("loginUser");
  ArrayList<Reserv> yList = (ArrayList)request.getAttribute("myResrvY");
  ArrayList<Reserv> list = (ArrayList)request.getAttribute("myResrvAll");
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
  <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/navi.css" />

  <title>예약 정보</title>

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

<body onload="chk();">
  <nav class="main-navi" style="background: #f2bba7;">
    <a href="<%= request.getContextPath() %>/WEB-INF/index.html">
      <div class="logo">
        <img src="<%= request.getContextPath() %>/img/public_img/logo.png" width="80px" height="80px" alt="잠자리"
          class="mx-2" />
      </div>
    </a>

    <div class="myPage">
      <label>
        <img onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'"
          src="<%= request.getContextPath() %>/img/public_img/profile.png" alt="마이페이지" class="profile" id="profile">
      </label>
    </div>

  </nav>

  <div class="container-fluid">

    <div class="row mx-auto my-4">
      <div class="col px-5">
        <h2>과거 모든 내역</h2>
      </div>
    </div>

    <div class="row mx-auto my-2">
      <div class="col px-5 mx-5" id="history">

        <table class="table table-border table-hover" id="historyTB">
          <thead>
            <tr>
              <th>예약 코드</th>
              <th>예약 인원</th>
              <th>여행 일자</th>
              <th>호스트</th>
            </tr>
          </thead>
          <tbody>
            <% if(list.isEmpty()) { %>
            <tr>
              <td colspan="4">조회된 기록이 없습니다.</td>
            </tr>
            <% } else { %>
            <%   for(int i = 0; i < list.size(); i++) { %>
            <tr>
              <td><%= list.get(i).getV_code() %></td>
              <td><%= list.get(i).getPersonnel() %></td>
              <td><%= list.get(i).getCheck_in() %> ~ <%= list.get(i).getCheck_out() %></td>
              <td><%= list.get(i).getRooms_host() %></td>
            </tr>
            <%   } %>
            <% } %>
          </tbody>
        </table>

      </div>
    </div>

    <div class="row mx-auto my-4">
      <div class="col px-5">
        <h2>현재 예약 내역</h2>
      </div>
    </div>

    <div class="row mx-auto my-2 mb-5">
      <div class="col px-5 mx-5" id="reserve">

        <table class="table table-border table-hover" id="logTB">
          <thead>
            <tr>
              <th>예약 코드</th>
              <th>호스트</th>
              <th>여행 일자</th>
              <th>예약 인원</th>
              <th>예약 상태</th>
            </tr>
          </thead>
          <tbody>
            <% if(yList.isEmpty()) { %>
            <tr>
              <td colspan="5">조회된 기록이 없습니다.</td>
            </tr>
            <% } else { %>
            <%   for(int i = 0; i < list.size(); i++) { %>
            <tr>
              <td><%= list.get(i).getV_code() %></td>
              <td><%= list.get(i).getRooms_host() %></td>
              <td><%= list.get(i).getCheck_in() %> ~ <%= list.get(i).getCheck_out() %></td>
              <td><%= list.get(i).getPersonnel() %></td>
              <td><%= list.get(i).getStatus() %></td>
            </tr>
            <%   } %>
            <% } %>
          </tbody>
        </table>

      </div>
    </div>

  </div>
</body>

</html>