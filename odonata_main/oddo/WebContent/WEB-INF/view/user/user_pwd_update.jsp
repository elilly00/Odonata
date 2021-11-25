<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
  User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>내 비밀번호 수정</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />


  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/user/user_my_page.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/login.css" />
  <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

  <style>
    .mask-custom {
      backdrop-filter: blur(15px);
      background-color: rgba(255, 255, 255, 0.2);
      border-radius: 3em;
      border: 2px solid rgba(255, 255, 255, 0.1);
      background-clip: padding-box;
      box-shadow: 10px 10px 10px rgba(46, 54, 68, 0.03);
    }
  </style>
</head>

<body>
  <nav class="main-navi">
    <div>
      <a class="logoo" href="<%= request.getContextPath() %>/WEB-INF/index.jsp">
        <img class="logoo" src="<%= request.getContextPath() %>/img/public_img/logo.png">
      </a>
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
  </nav>

  <section class="intro">
    <div class="mask d-flex align-items-center h-100">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-7 col-xl-6">
            <div class="card mask-custom">
              <div class="card-body p-5">
                <div class="my-4">
                  <h2 class="text-center mb-5">내 비밀번호 변경</h2>

                  <form action="<%= request.getContextPath() %>/updatePwd.us" method="post" id="updatePwdForm"
                    name="updatePwdForm" onsubmit="return insertValidate();">
                    <div class="form-floating form-white mb-4">
                      <input type="password" id="uPwd" name="uPwd" class="form-control form-control-lg" />
                      <label class="form-label" for="uPwd">현재 비밀번호</label>
                    </div>
                    <div class="form-floating form-white mb-4">
                      <input type="password" id="newPwd1" name="newPwd1" class="form-control form-control-lg" />
                      <label class="form-label" for="newPwd1">새로운 비밀번호</label>
                    </div>
                    <div class="form-floating form-white mb-4">
                      <input type="password" id="newPwd2" name="newPwd2" class="form-control form-control-lg" />
                      <label class="form-label" for="newPwd2">새로운 비밀번호 확인</label>
                    </div>

                    <button type="submit" class="btn btn-secondary btn-block">변경</button>
                    <button type="button" class="btn btn-secondary btn-block"
                      onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">취소</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <script>
    /* ------------------------------------------------------------ */


    /* 비밀번호 확인 */
    var isPwdUsable = false;

    $('#newPwd1').one('focus', function () {
      alert('비밀번호는 최소 8자, 최대 12자의 영어, 숫자, !, *, $, %, &만 가능합니다.');
    });

    $('#newPwd1').blur(function () {
      var userPwd = $(this).val();
      var regExpPwd = /[^0-9A-Za-z!*$%&]/g;

      if (!regExpPwd.test(userPwd) && !(userPwd.length < 8 || userPwd.length > 12)) {
        $("label[for='newPwd1']").text('비밀번호: 사용 가능').css({
          'color': 'green',
          'font-weight': 'bold'
        });
        isPwdUsable = true;
      } else {
        $("label[for='newPwd1']").text('비밀번호: 사용 불가').css({
          'color': 'red',
          'font-weight': 'bold'
        });
        isPwdUsable = false;
      }
    });

    /* 비밀번호 중복 확인 */
    var isPwdChecked = false;

    $('#newPwd2').keyup(function () {
      var pwd1 = $('#newPwd1').val();
      var pwd2 = $('#newPwd2').val();
      if (pwd1 == pwd2) {
        $("label[for='newPwd2']").text('비밀번호 확인: 일치').css({
          'color': 'green',
          'font-weight': 'bold'
        });
        isPwdChecked = true;
      } else {
        $("label[for='newPwd2']").text('비밀번호 확인: 불일치').css({
          'color': 'red',
          'font-weight': 'bold'
        });
        isPwdChecked = false;
      }
    });


    /* ------------------------------------------------------------ */


    /* 입력 정보 최종 확인 */
    function insertValidate() {
      if (isPwdUsable && isPwdChecked) {
        console.log('isPwdUsbale: ' + isPwdUsable);
        console.log('isPwdChecked: ' + isPwdChecked);
        return true;
      } else {
        alert('입력된 비밀번호를 확인해주세요.');
        return false;
      }
    }
  </script>
</body>

</html>