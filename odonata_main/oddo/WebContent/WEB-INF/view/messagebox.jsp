<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>

    <link rel="shortcut icon" href="<%= request.getContextPath() %>/img/airbnb.ico" type="image/x-icon" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/style/navi.css" />

    <title>내 쪽지함</title>

    <style>
      /* html, body {
      height: 100%;
      width: 100%;
    } */
      #message {
        background: lightgray;
        height: 200px;
      }
      #messageBox {
        background: lightgray;
        height: 400px;
      }
      #messageText,
      #messageTB {
        width: 100%;
      }
    </style>
  </head>
  <body>
    <nav class="main-navi" style="background: #f2bba7">
      <a href="index.html">
        <div class="logo">
          <img
            src="<%= request.getContextPath() %>/img/public_img/logo.png"
            width="80px"
            height="80px"
            alt="잠자리"
            class="mx-2"
          />
        </div>
      </a>

      <div class="menu">
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
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row mx-auto my-4">
        <div class="col px-5">
          <h2>내 쪽지함</h2>
        </div>
      </div>

      <div class="row mx-auto my-2">
        <div class="col px-5 mx-5" id="message">
          <table class="table table-borderless" id="messageText">
            <thead>
              <tr>
                <th class="col-md-1">쪽지입니다요</th>
                <td class="col-md-1">from &nbsp;&nbsp;&nbsp;&nbsp;<b>KH</b></td>
                <td>2021-10-28 15:15:42</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan="3">
                  쪽지 내용입니다 이게 쪽지 내용인데 쪽지 내용이므로 쪽지
                  내용입니다<br />
                  쪽지 내용인지 알겠죠? 쪽지 내용이라고 안보여도 쪽지
                  내용입니다<br />
                  쪽지 내용!!
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="row mx-auto mt-4">
        <div class="col px-5">
          <h2>쪽지 보관함</h2>
        </div>
      </div>

      <div class="mx-5">
        <button type="button" class="btn btn-secondary btn-sm btn-block">
          답장
        </button>
        <button type="button" class="btn btn-secondary btn-sm btn-block">
          보관
        </button>
        <button type="button" class="btn btn-secondary btn-sm btn-block">
          삭제
        </button>
      </div>

      <div class="row mx-auto my-2 mb-4">
        <div class="col px-5 mx-5" id="messageBox">
          <table class="table table-border table-hover" id="messageTB">
            <thead>
              <tr>
                <th>제목</th>
                <th>보낸이</th>
                <th>보낸 시간</th>
                <th>읽은 시간</th>
                <th>
                  <div>
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="checkboxAll"
                      value=""
                      aria-label="checkAll"
                    />
                  </div>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>쪽지입니다요</td>
                <td>KH</td>
                <td>2021-10-28 15:15</td>
                <td>2021-10-28 15:17</td>
                <td>
                  <div>
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="checkbox2"
                      value=""
                      aria-label="checkOne"
                    />
                  </div>
                </td>
              </tr>
              <tr>
                <td>여보세요?</td>
                <td>KH</td>
                <td>2021-10-28 12:47</td>
                <td>2021-10-28 12:48</td>
                <td>
                  <div>
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="checkbox1"
                      value=""
                      aria-label="checkOne"
                    />
                  </div>
                </td>
              </tr>
              <tr>
                <td>저기요?</td>
                <td>KH</td>
                <td>2021-10-28 12:48</td>
                <td>읽지 않음</td>
                <td>
                  <div>
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="checkbox2"
                      value=""
                      aria-label="checkOne"
                    />
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>
