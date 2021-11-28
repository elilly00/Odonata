<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>idfind</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/user/user_id_pw_check.css" />
  <%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/style/user/user_id_pw_check.css" /> --%>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

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
  

  <div class="main-page">
    <section class="intro">
      
      
        <div class="mask d-flex align-items-center h-100">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-12 col-md-10 col-lg-7 col-xl-6">
                <div class="card mask-custom">
                  <div class="card-body p-5">
                    <div class="my-4">
                      <h2 class="text-center mb-3">아이디 찾기</h2>
                      <h5 class="text-center mb-3">아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</h5>
                      
                      <form action="<%= request.getContextPath() %>/idfind.us" method="post" role="form">
                        
                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="name"
                            name="name"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >이름</label
                          >
                        </div>

                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="email"
                            name="email"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >이메일</label
                          >
                        </div>

                      

                        <div
                          class="form-check d-flex justify-content-center mb-4"
                        >
                          
                        </div>

                        
                        
                        <input type="submit" value="찾기" class="submit-btn" />
                        
                        
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  <script>


  </script>

</body>

</html>