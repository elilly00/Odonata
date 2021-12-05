<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User, java.text.SimpleDateFormat"%>
<%
  User loginUser = (User)session.getAttribute("loginUser");
  String userBirth = new SimpleDateFormat("YYYY-MM-dd").format(loginUser.getUser_birth());
%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>내 정보 보기</title>
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
<header>
  <nav class="main-navi">
    <div>
      <a class="logoo" href="<%= request.getContextPath() %>">
        <img class="logoo" src="<%= request.getContextPath() %>/img/public_img/logo.png">
      </a>
    </div>
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
      <div class="item menusolo">
      </div>
      <div class="button" type="button" onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">
        <img class="profile" src="<%= request.getContextPath() %>/img/public_img/profile.png" alt="마이페이지"
          id="profile" />
      </div>
      <% } %>
    </div>
  </nav>
  </header>

  <section class="intro">
    <div class="mask d-flex align-items-center h-100">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-7 col-xl-6">
            <div class="card mask-custom">
              <div class="card-body p-5">
                <div class="my-4">
                  <h2 class="text-center mb-5">내 정보</h2>

                  <div class="row">
                    <div class="col-12 col-md-6 mb-4">
                      <div class="form-floating form-white">
                        <input type="text" id="uId" name="uId" class="form-control form-control-lg" readonly
                          value="<%= loginUser.getUser_id() %>" />
                        <label class="form-label" for="uId">아이디</label>
                      </div>
                    </div>
                    <div class="col-12 col-md-6 mb-4">
                      <div class="form-floating form-white">
                        <input type="text" id="uName" name="uName" class="form-control form-control-lg" readonly
                          value="<%= loginUser.getUser_name() %>" />
                        <label class="form-label" for="uName">이름</label>
                      </div>
                    </div>
                  </div>

                  <div class="form-floating form-white mb-4">
                    <input type="text" id="uEmail" name="uEmail" class="form-control form-control-lg" readonly
                      value="<%= loginUser.getUser_email() %>" />
                    <label class="form-label" for="uEmail">이메일</label>
                  </div>

                  <div class="form-floating form-white mb-4">
                    <input type="tel" id="uPhone" name="uPhone" class="form-control form-control-lg" readonly
                      value="<%= loginUser.getUser_phone() %>" />
                    <label class="form-label" for="uPhone">휴대전화</label>
                  </div>

                  <div class="form-floating form-white mb-4">
                    <input type="text" id="uBirth" name="uBirth" class="form-control form-control-lg" readonly
                      value="<%= userBirth %>" />
                    <label class="form-label" for="uBirth">생년월일</label>
                  </div>

                  <input type="button" value="내 정보 수정" class="btn btn-secondary btn-sm btn-block"
                    onclick="location.href='<%= request.getContextPath() %>/updateForm.us'" />
                  <input type="button" value="비밀 번호 변경" class="btn btn-secondary btn-sm btn-block"
                    onclick="location.href='<%= request.getContextPath() %>/updatePwdForm.us'" />
                  <input type="button" value="쪽지" class="btn btn-secondary btn-sm btn-block"
                    onclick="location.href='<%= request.getContextPath() %>/msgBoxForm.ms'" />
                  <input type="button" value="과거 예약 내역" class="btn btn-secondary btn-sm btn-block"
                    onclick="location.href='<%= request.getContextPath() %>/myResrvForm.rv'" />
                  <input type="button" value="숙소 등록" class="btn btn-secondary btn-sm btn-block"
                    onclick="location.href='<%= request.getContextPath() %>/regist.ro'" />
                  <input type="button" value="탈퇴" class="btn btn-secondary btn-sm btn-block"
                    onclick="deleteUser();" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <script>
    function deleteUser() {
        var bool = confirm('정말로 탈퇴하시겠습니까?');
        if(bool)
            location.href='<%= request.getContextPath() %>/deleteUser.us';
    }
  </script>

</body>

</html>