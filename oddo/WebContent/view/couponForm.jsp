<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title>쿠폰/할인코드 입력</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="../style/main.css" />
    <script src="../js/jquery-3.6.0.min.js"></script>

    <style>
      /* 고려 사항 : 전체창으로 띄우지 않고 크기 지정해서 띄우고싶음. 대략 가로 500px 정도? 생각중 */

      .main-navi {
        /* 화면상단에 붙어있는 포지션 */
        padding-right: 100px;
        position: sticky;
        top: 0;
        background-color: /* #f2bba7 */ lightgray;
        width: 100%;
        height: 60px;
        padding: 5 70px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      header {
        margin: 0px;
        padding: 0px;
      }

      .content {
        font-size: 100%;
        margin-left: 20px;
        margin-right: 20px;
      }

      #couponTitle {
        /* display: flex; */
        margin: 0 auto;
      } /* ★ 반응형으로 화면 크기가 조절되어도 가운데 정렬 되게 하고싶지만 안됐음 */

      .coupon {
        width: 200px;
      }

      #cardList {
        border: 1px solid black;
        border-radius: 20px;
        padding: 5px;
        /* width: 460px; */
        height: 50px;
      }

      #deleteBut {
        width: 60px;
        height: 25px;
      }

      #addCardBut {
        display: block;
        margin: auto;
      }
    </style>
  </head>
  <body>
    <nav class="main-navi">
      <h2 id="couponTitle">쿠폰/할인코드</h2>
      <!-- <div class="logo"> -->
      <!--         <a href="index.html"> -->
      <!--           <div class="logo"> -->
      <!--             <img -->
      <!--               src="../img/logo.png" -->
      <!--               width="80px" -->
      <!--               height="80px" -->
      <!--               alt="잠자리" -->
      <!--               class="mx-2" -->
      <!--             /> -->
      <!--           </div> -->
      <!--         </a> -->
      <!--       </div> -->
    </nav>
    <div class="content">
      <br />
      <h3>쿠폰/할인코드 적용</h3>
      <hr />
      <br />

      <select name="coupon" style="width: 300px; height: 30px">
        <option>쿠폰번호</option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
      </select>
      <br />
      <br />
      <h3>쿠폰/할인코드 적용</h3>
      <br />
      <div id="cardList"></div>

      <br />
      <button onclick="addCard" id="addCardBut" value="결제 수단 등록">
        결제 수단 등록
      </button>
    </div>
  </body>
</html>
