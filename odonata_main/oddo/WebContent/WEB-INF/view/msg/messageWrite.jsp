<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
  User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
  <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

  <link rel="shortcut icon" href="<%= request.getContextPath() %>/img/airbnb.ico" type="image/x-icon" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/navi.css" />

  <title>쪽지 작성</title>

  <style>
    /* html, body {
      height: 100%;
      width: 100%;
    } */

    #messageInsert {
      background: lightgray;
      height: 400px;
    }
  </style>
</head>

<body>
<header>
  <nav class="main-navi" style="background: #f2bba7">
    <a href="<%= request.getContextPath() %>">
      <div class="logo">
        <img src="<%= request.getContextPath() %>/img/public_img/logo.png" width="80px" height="80px" alt="잠자리"
          class="mx-2" />
      </div>
      <%-- 로그인 / 마이페이지 / 로그아웃 --%>
      <div class="roginmenu">
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

      <%-- 로그인 / 마이페이지 / 로그아웃 끝 --%>
    </a>

    <%-- <div class="menu">
        <button
          type="button"
          onclick="location.href='login.html'"
          class="item menusolo hostdg"
        >
          로그인/회원가입
        </button>
        <div class="item menusolo"></div>
        <div class="item menuset">
          <button
            class="mypage"
            type="button"
            onclick="location.href='login.html'"
            class="item menusolo hostdg"
          >
            <i class="fas fa-user-circle"></i>
          </button>
        </div>
      </div> --%>
  </nav>
</header>

  <div class="container-fluid">
    <div class="row mx-auto my-4">
      <div class="col px-5">
        <h2>쪽지 작성</h2>
      </div>
    </div>

    <div class="row justify-content-center">
      <div class="col-12 col-md-10 col-lg-7 col-xl-6">
        <div class="card-body p-5">
          <div class="row mx-auto my-2 mb-4">
            <form action="<%= request.getContextPath() %>/insert.ms" method="post" id="msgWrite" name="msgWrite"
              onsubmit="return insertValidate();">
              <table class="table table-border" id="messageInsert">
                <tr>
                  <th>
                    <div class="form-floating">
                      <input type="text" id="sendId" name="sendId" class="form-control"
                        value="<%= loginUser.getUser_id() %>" readonly>
                      <label class="form-label" for="sendId">보내는 사람 아이디</label>
                    </div>
                  </th>
                  <th>
                    <div class="form-floating">
                      <input type="text" id="recvId" name="recvId" class="form-control">
                      <label class="form-label" for="recvId">받는 사람 아이디</label>
                    </div>
                  </th>
                </tr>
                <tr>
                  <th colspan="2">
                    <div class="form-floating">
                      <input type="text" id="msgTitle" name="msgTitle" class="form-control">
                      <label class="form-label" for="msgTitle">제목</label>
                    </div>
                  </th>
                </tr>
                <tr>
                  <td colspan="2">
                    <div class="form-floating">
                      <textarea class="form-control" id="msgContent" name="msgContent" style="height: 300px"></textarea>
                      <label for="msgContent">쪽지 내용</label>
                    </div>
                  </td>
                </tr>
              </table>
              <button type="submit" class="btn btn-secondary btn-block">보내기</button>
              <button type="button" class="btn btn-secondary btn-block mx-4"
                onclick="location.href='<%= request.getContextPath() %>/msgBoxForm.ms'">취소</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script>
  /* ------------------------------------------------------------ */


  /* 아이디 검사 */
  var isIdChecked = false;

  $('#recvId').on('change paste keyup', function () {
    isIdChecked = false;
  });

  $('#recvId').change(function () {
    var recvId = $('#recvId');
    console.log(recvId);

    if (!recvId) {
      recvId.focus();
    } else {
      $.ajax({
        url: 'checkId.us',
        data: {
          inputId: recvId.val()
        },
        success: function (data) {
          console.log(data);
          if (data.trim() == '0') {
            $("label[for='recvId']").text('받는 사람 아이디: 없는 아이디').css({
              'color': 'red',
              'font-weight': 'bold'
            });
            isIdChecked = false;
          } else {
            $("label[for='recvId']").text('받는 사람 아이디: 발송 가능').css({
              'color': 'black',
              'font-weight': 'bold'
            });
            isIdChecked = true;
          }
        },
        error: function (data) {
          console.log(data);
        }
      });
    }
  });


  /* ------------------------------------------------------------ */


  /* 제목 확인 */
  var titleChk = false;

  $('#msgTitle').blur(function () {
    var msgTitle = $(this).val();

    if (msgTitle == null || msgTitle.length < 2) {
      $("label[for='msgTitle']").text('제목: 미작성').css({
        'color': 'red',
        'font-weight': 'bold'
      });
      titleChk = false;
    } else {
      $("label[for='msgTitle']").text('제목').css({
        'color': 'black',
        'font-weight': 'bold'
      });
      titleChk = true;
    }
  });




  /* ------------------------------------------------------------ */


  /* 입력 정보 최종 확인 */
  function insertValidate() {
    var confirmMSG = confirm("쪽지를 발송하시겠습니까?");

    if (confirmMSG) {
      if (isIdChecked && titleChk) {
        console.log('isIdChecked: ' + isIdChecked);
        console.log('titleChk: ' + titleChk);
        return true;
      } else {
        alert('입력된 정보를 확인해주세요.');
        return false;
      }
    } else {
      return false;
    }
  }
</script>

</html>