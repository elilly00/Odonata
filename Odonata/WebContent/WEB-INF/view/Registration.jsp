<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Registration</title>
    <style>
      /*  	 margin : 여백  / padding : 면적  */
      * {
        margin: 0 auto;
        list-style: none;
        text-decoration: none;
        border-collapse: collapse;
        color: black;
      }
      /* => 위,아래,왼쪽,오른쪽의 여백(margin)이 0이라는 뜻 */
      /* 		auto => 좌,우 바깥여백이 자동할당된다는 뜻(즉, 자동으로 중앙정렬이 된다) */

      .wrap {
        /* 화면상단에 붙어있는 포지션 */
        position: sticky;
        top: 0;
        height: 70px;
        /*  	    display: flex;  */
        /*  	    justify-content: space-between;  */
        /*   	    align-items: center; */
      }

      .header {
        display: flex; /* 가로로 정렬 됨 */
        width: 100%;
        margin: 0 auto;
        height: 61px;
        background: white;
        border-radius: 10px;
        background: #d99982;
        box-shadow: 0px 4px 4px lightgray;
        /* 		margin-left: 90px; */
      }

      .logo {
        width: 80%;
        height: 61px;
        line-height: 60px;
        margin-left: 40px;
      }

      /* #btn_img{
 		margin: 10px;
 		border-radius: 30px;
 		cursor: pointer;
 		width: 50px;
 	} */

      .nav {
        width: 20px;
        margin-right: 40px;
        margin-top: 10px;
      }

      /* .burger-icon {
	  cursor: pointer;
	  display: inline-block;
	  position: absolute;
	  z-index: 2;
	  padding: 8px 0;
	  top: 4px;
	  right: 4px;
	  user-select: none;
	  width: auto;
	  margin: 0;
	} */

      .nav > li {
        margin-right: 1px; /* li간 간격 띄여주기 */
        text-align: center;
        line-height: 60px;
        color: black;
        height: 61px;
      }

      .body {
        width: 865px;
        margin-top: 50px;
        text-align: center;
      }

      /* 등록완료 버튼 */
      .submit {
        width: 100px;
        height: 36px;
        background-color: #d99982;
        color: white;
        cursor: pointer;
        border: none;
        border-radius: 15px;
      }
    </style>
  </head>
  <body>
    <!-- 	<nav class="nav-right-items"> -->
    <!-- 		<div class="nav-item1">저장 및 나가기</div> -->
    <!--   		<button class="nav-item2">로그아웃</button>  -->
    <!-- 	</nav> -->

    <!-- 	 <nav class="main-navi"> -->
    <!--             <div class="logo"> -->
    <!--                 <i></i> 잠자리 -->
    <!--             </div> -->

    <!--             <div class="menu"> -->
    <!--                 <button type="button" onclick="#'" class="item menusolo hostdg">저장 및 나가기</button> -->
    <!--                 <div class="item menusolo"> -->
    <!--                     <i class="fas fa-globe"></i> -->
    <!--                 </div> -->
    <!--                 <div class="item menuset"> -->
    <!--                     <i class="fas fa-bars"></i> -->
    <!--                     <i class="fas fa-user-circle"></i> -->
    <!--                 </div> -->
    <!--             </div> -->
    <!--         </nav> -->

    <div class="wrap">
      <div class="main_nav">
        <div class="header">
          <div class="logo">
            <a href="index.html">잠자리</a>
          </div>
          <div class="nav">
            <div class="img">
              <!-- 					<button type="button" class="btn_image" id="btn_img" > -->
              <img src="../images/profile.png" style="width: 35px; height: 35px" />
              <!-- 					</button> -->
              <!-- 				<li><a href="#">마이페이지</a></li> -->
              <!-- 				<li><a href="#">로그아웃</a></li> -->
            </div>
          </div>
        </div>
      </div>
    </div>

    <form>
      <div class="body">
        <div>
          <h3>숙소 유형</h3>

          <br />

          <select name="kind">
            <option>숙소 유형</option>
            <option value="apt">아파트</option>
            <option value="house">주택</option>
            <option value="outhouse">별채</option>
            <option value="gesthous">게스트하우스</option>
          </select>
        </div>

        <br /><br />

        <div>
          <h3>최대 숙박 인원</h3>

          <br />

          <input type="button" onclick="count" value="+" />
          <span id="result">0</span>
          <input type="button" onclick="count" value="-" />
        </div>

        <br /><br />

        <div class="location">
          <h3>숙소 위치</h3>
          <pre>
			
	정확한 숙소 주소를 기입해주세요
		
			</pre
          >
          <div class="location1">
            <span>시/도</span>
            <input type="text" placeholder="예) 서울특별시" size="10" />
            <span>시/군/구</span>
            <input type="text" placeholder="예) 강남구" size="10" />
          </div>
          <div class="location2">
            도로명 주소
            <div>
              <input type="text" placeholder="예) 테헤란로 14길" />
            </div>
          </div>
          <div class="location3">
            동호수(선택사항)
            <div>
              <input type="text" placeholder="예) 2층" />
            </div>
          </div>
          <div class="location4">
            우편번호
            <div>
              <input type="text" placeholder="예) 06234" />
            </div>
          </div>
        </div>

        <br /><br />

        <div>
          <h3 id="photo">숙소 사진</h3>
          <pre>
				
	숙소 사진을 등록해주세요.
				</pre
          >
          <img id="preview" width="300" height="300" />
          <br />
          <input type="file" onchange="readURL(this);" multiple />
          <script>
            function readURL(input) {
              if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                  document.getElementById("preview").src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
              } else {
                document.getElementById("preview").src = "";
              }
            }
          </script>
          <!-- 사진 미리보기 (여러 개 보는 방법 찾기) -->
        </div>
        <br /><br />

        <div>
          <h3 id="option">편의 시설</h3>

          <br />

          <input type="checkbox" value="essentials" />필수 품목(수건,휴지,치약)
          <br />
          <input type="checkbox" value="wifi" />무선인터넷 <br />
          <input type="checkbox" value="sampoo/conditioner" />샴푸/컨디셔너
          <br />
          <input type="checkbox" value="tube" />욕조 <br />
          <input type="checkbox" value="tv" />TV <br />
          <input type="checkbox" value="air conditioner" />에어컨 <br />
          <input type="checkbox" value="hair dryer" />헤어드라이어 <br />
          <input type="checkbox" value="iron" />다리미 <br />
          <input type="checkbox" value="breakfast" />조식 <br />
          <input type="checkbox" value="coffee machine" />커피머신기 <br />
          <input type="checkbox" value="kitchen" />주방 <br />
          <input type="checkbox" value="" />세탁기 <br />
          <input type="checkbox" value="" />건조기<br />
        </div>

        <br /><br />

        <div>
          <h3 id="explain">상세 설명</h3>
          <pre>

숙소에 대해 간략하게 설명해주세요.
숙소 근처 관광지, 맛집 등 주변 지역에 대한 정보를 설명해주세요.

		</pre
          >
          <textarea cols="50" rows="10" placeholder=""></textarea>
        </div>

        <br /><br />

        <div>
          <input type="submit" value="등록완료" class="submit" />
        </div>
      </div>

      <br />
    </form>
  </body>
</html>
