<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User" %>
<%
  User loginUser = (User)session.getAttribute("loginUser");
%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Registration</title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/style/Registration.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>

      </head>
      <body>
        <div class="header">
          <div class="logo">
            <label>
              <a href="<%= request.getContextPath() %>/WEB-INF/index.html">
               <img src="<%= request.getContextPath() %>/img/public_img/logo.png" 
                alt="메인페이지" 
                id="main">
              </a>
            </label>
          </div>
          <div class="img">
            <a href="<%= request.getContextPath() %>/myPageForm.us">
              <img
                src="<%= request.getContextPath() %>/img/public_img/profile.png"
                alt="마이페이지" 
                id="profile"/>
              </a>
          </div>
        </div>
    
        <form action="<%= request.getContextPath() %>/insert.ro" method="post" encType="multipart/form-data">
          <div class="body">
            <div>
              <h3>숙소 유형</h3>
    
              <br />
    
              <select class="kind" name="roomType">
                <option>숙소 유형</option>
                <option value="공동 주택">공동 주택</option>
                <option value="주택">주택</option>
                <option value="별채">별채</option>
                <option value="게스트하우스">게스트하우스</option>
              </select>
            </div>
    
            <br /><br />
    
            <div class="location">
              <h3>숙소 위치</h3>
              <pre>
          
    정확한 숙소 주소를 기입해주세요
        
              </pre>
              <div class="location2">
                <ul class="input">
                  <li>
                    <span>시/도</span>
                      <input type="text" placeholder="예) 서울특별시" class="location-input1"  name="roomAddr" required/>
                    <span>시/군/구</span>
                      <input type="text" placeholder="예) 강남구" class="location-input1" name="roomAddr" required/>
                  </li>
                  <li>
                    <p>도로명 주소</p>
                      <input type="text" placeholder="예) 테헤란로 14길" class="location-input2" name="roomAddr" required/>
                  </li>
                  <li>
                    <p>동호수(선택사항)</p>
                      <input type="text" placeholder="예) 2층" class="location-input2" name="roomAddr" />
                  </li> 
                  <li>
                    <p>우편번호</p>
                      <input type="text" placeholder="예) 06234" class="location-input2" name="roomAddr" required/>
                  </li>
                </ul>
              </div>
            </div>
    
            <br /><br />
            
            <div class="price">
              <h3>1박당 요금</h3>
              <br>
              <input type="text" placeholder="가격을 입력하세요" class="room-price" name="roomPrice" required/>
            </div>
            
            <br /><br />
            
            <!-- 데이터를 어떻게 보내야 할지 모르겠어서 type을 number로 변경했습니다. -->
            <div id="button"> 
              <h3>최대 숙박 인원</h3>
              <br />
            <ul>
              <li>
                <input type=number name="personNum" id="personNum" min="1" max="10" step="1" placeholder="0"/>
              </li>
            </ul>
  
          <br />
  
            <h3>침실 개수</h3>
            <br />
            <ul>
              <li>
                <input type=number name="roomCnt" id="roomCnt" min="1" max="4" step="1" placeholder="0"/>
                
              </li>
            </ul> 
  
          <br />
  
            <h3>욕실 개수</h3>
            <br />
            <ul>
              <li>
                <input type=number name="toiletCnt" id="toiletCnt" min="1" max="3" step="1" placeholder="0"/>
              </li>
            </ul>
     	 </div>
        
            <br /><br />
            
<!--             <div class="check"> -->
<!--               <h3>반려동물 동반 가능 여부</h3> -->
<!--               <br /> -->
<!--               <label class="switch-button">  -->
<!--                 <input type="checkbox" id="pet" name="pet"/>  -->
<!--                 <span class="onoff-switch"> -->
<!--                 </span>  -->
<!--               </label> -->
<!--             </div> -->
    		
<!--             <br /><br /> -->
            
            <div>
              <h3 id="option">편의 시설</h3>
            
              <br />
            
              <input type="checkbox" value="필수 품목(수건,휴지,치약)" name="amenity" checked/>필수 품목(수건,휴지,치약)<br />
              <input type="checkbox" value="wifi" name="amenity"/>무선인터넷 <br />
              <input type="checkbox" value="샴푸/컨디셔너" name="amenity"/>샴푸/컨디셔너<br />
              <input type="checkbox" value="욕조" name="amenity"/>욕조 <br />
              <input type="checkbox" value="TV" name="amenity"/>TV <br />
              <input type="checkbox" value="에어컨" name="amenity"/>에어컨 <br />
              <input type="checkbox" value="헤어드라이어" name="amenity"/>헤어드라이어 <br />
              <input type="checkbox" value="다리미" name="amenity"/>다리미 <br />
              <input type="checkbox" value="조식" name="amenity"/>조식 <br />
              <input type="checkbox" value="커피머신기" name="amenity"/>커피머신기 <br />
              <input type="checkbox" value="주방" name="amenity"/>주방 <br />
              <input type="checkbox" value="세탁기" name="amenity"/>세탁기 <br />
              <input type="checkbox" value="건조기" name="amenity"/>건조기<br />
              <input type="checkbox" value="무료 주차장" name="amenity"/>무료 주차장<br />
              <input type="checkbox" value="반려동물 동반 가능" name="amenity"/>반려동물 동반<br />
              </div>
            
            <br /><br />
            
            <div>
              <h3 id="photo">숙소 사진</h3>
              <pre>
                
    숙소 사진을 등록해주세요.
                
              </pre>

            <table id="insertTumbtable">
            	<tr>
                <th>대표 이미지</th>
                  <td colspan="3">
                    <div id="titleImgArea">
                      <img id="titleImg"  width="350" height="200">
                    </div>
                  </td>
				      </tr>
				      <tr>
					      <th>숙소 상세 사진</th>
                  <td>
                    <div id="contentImgArea1">
                      <img id="contentImg1" width="150" height="110"> 
                    </div>
                  </td>
				          <td>  
                    <div id="contentImgArea2">
                      <img id="contentImg2"  width="150" height="110"> 
                    </div>
                  </td>
                  <td>
                    <div id="contentImgArea3">
                      <img id="contentImg3"  width="150" height="110"> 
                    </div>
                  </td>
              </tr>
            </table>
            
            <div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
				<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
			</div>
			</div>
            <br /><br />
            
    
            <div>
              <h3 id="explain">상세 설명</h3>
              <pre>
    
    숙소에 대해 간략하게 설명해주세요.
    숙소 근처 관광지, 맛집 등 주변 지역에 대한 정보를 설명해주세요.
    
              </pre>
        
              <textarea cols="50" rows="10" placeholder="내용을 입력해주세요" name="Desc"></textarea>
            </div>
            
            <br /><br />
            
    		<div>
            <h3 id="host">호스트 이름</h3>
           	 	<pre>
            
  호스트 이름을 작성해주세요.
          
             	</pre>
            
          		<input type="text" placeholder="별명 가능" class="hostName" name="roomHost">
            </div>
            
            <br /><br />
            
            <div>
            <h3 id="roomName">숙소 이름</h3>
            	<pre>
            
  숙소 이름을 지어주세요.
          
            	</pre>
            
            	<input type="text" placeholder="숙소 이름 작성" class="roomName" name="roomName">
            </div>
            
            <br /><br />
            
            <div class="fini">
              <!-- 숙소 등록 완료 시 메인페이지로 이동함 -->
                <input type="submit" value="등록완료" class="submit" onclick="location.href='<%= request.getContextPath() %>'"/>
              </div>
            </div>
      
            <br />
            
          </form>
    
          <script>
	        // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	        $(function(){
	          $("#fileArea").hide(); 
	            
	          $("#titleImgArea").click(function(){ 
	              $("#thumbnailImg1").click();
	            });
	            $("#contentImgArea1").click(function(){
	              $("#thumbnailImg2").click();
	            });
	            $("#contentImgArea2").click(function(){
	              $("#thumbnailImg3").click();
	            });
	            $("#contentImgArea3").click(function(){
	              $("#thumbnailImg4").click();
	            });
	          });
	              
	          // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
	          function LoadImg(value, num){			
	          if(value.files && value.files[0]){	
	            var reader = new FileReader();	
	                  
	            reader.onload = function(e){								
	            switch(num){
	            case 1: 
	              $("#titleImg").attr("src", e.target.result);
	                break;
	            case 2:
	              $("#contentImg1").attr("src", e.target.result);
	                break;
	            case 3: 
	              $("#contentImg2").attr("src", e.target.result);
	                break;
	            case 4:
	              $("#contentImg3").attr("src", e.target.result);
	                break;
	              }
	            }
	                  
	              reader.readAsDataURL(value.files[0]);	// 여러 파일을 선택했을 때 가장 앞에 있는 파일만 올라가도록 하는 것
	            }
	          }
      </script>
       
      </body>
    </html>