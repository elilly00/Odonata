<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="user.model.vo.User" %>
<%
  User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/user/user_my_page.css" />

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
  <nav class="main-navi">
    <a class="logoo" href="<%= request.getContextPath() %>/WEB-INF/index.jsp">
      <img class="logoo" src="<%= request.getContextPath() %>/img/public_img/logo.png">
    </a>
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
  </nav>

  <!-- <div class="main-page"> -->
    <section class="intro">
      
      
        <div class="mask d-flex align-items-center h-100">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-12 col-md-10 col-lg-7 col-xl-6">
                <div class="card mask-custom">
                  <div class="card-body p-5">
                    <div class="my-4">
                      <h2 class="text-center mb-5">내 정보 수정</h2>

                      <form action="<%= request.getContextPath() %>/insert.us" method="post" id="joinForm" name="joinForm" onsubmit="return insertValidate();">
                        <div class="row">
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="text"
                                id="uId"
                                name="uId"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uId">아이디</label>
                            </div>
                          </div>
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="name"
                                id="name1"
                                name="name1"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uPwd1"
                                >이름</label
                              >
                            </div>
                          </div>
                        </div>

                        

                        

                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="uPhone"
                            name="uPhone"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >이메일</label
                          >
                        </div>

                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="uPhone"
                            name="uPhone"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >휴대전화</label
                          >
                        </div>

                        <div class="form-floating form-white mb-4">
                          <input
                            type="text"
                            id="uBirth"
                            name="uBirth"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uBirth"
                            >생년월일</label
                          >
                        </div>

                        <div
                          class="form-check d-flex justify-content-center mb-4"
                        >
                          
                        </div>

                        
                        
                        <input type="submit" value="수정 하기" class="submit-btn" />
                        <input type="submit" value="취소" class="submit-btn" />
                        
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