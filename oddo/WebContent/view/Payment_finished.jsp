<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="../style/Payment_finished.css" />

</head>

<body>
  <nav class="main-navi">
    <a class="logoo" href="../index.jsp">
      <img class="logoo" src="../img/logo.png">
    </a>
    </div>
    <div class="button" type="button" onclick="location.href='mypage.jsp'">
      <!-- <a href="mypage.jsp"> -->
      <img src="../images/profile.png" alt="마이페이지" id="profile" style="height:40px;" />
      </a>
    </div>
  </nav>

  <div class="main-page">
    <div class="login-form">


      <form id="loginForm" method="post">

      </form>

      <!-- 결제 -->
      <h2 id="couponTitle">결제</h2>
      <hr>
      <!-- 결제끝 -->
      </nav>

      <!-- 결제 완료 -->
      <div class="content">

        <h3 class="title1">결제가 정상적으로 완료되었습니다.</h3>
        <hr />
        <!-- 결제 완료 끝 -->


        <!-- 숙소 정보 -->
        <div class="title2">

          
          <h4>숙소 정보</h4>
          <div class="test1">
            <!-- 숙소 썸네일 -->
          </div>

          <div class="test2">
            <h5>위치</h5>
            <h5>숙소 이름</h5>
            <h5>연락처</h5>
            <h5>체크인/체크아웃</h5>


          </div>

          <!-- <div class="test3">
            <iframe
              loading: lazy;
            ></iframe>
          </div> -->

        </div>
        <hr>



      </div>
      <!-- 숙소 정보 끝 -->

      <div>
        <h4>결제 정보</h4>

        <div class="title3">
          <div class="title4">
          <h5>카드 간편결제</h5>
          <h5>삼성(*****************)</h5>
          <h5>일시불</h5>
          <h5>승인일시:</h5>
          </div>
        </div>

        <div class="title5">
          <div class="title6">
            <h5>총 금액 :</h5>
            <hr>
            <h5>쿠폰/할인금액 :</h5>
            
            <h3>결제금액 :</h3>
          </div>

        </div>
      </div>


    </div>
  </div>

  <script>


  </script>
</body>

</html>