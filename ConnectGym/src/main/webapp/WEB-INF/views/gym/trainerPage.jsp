<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    
    <style>
#trainer {
	width: 65%;
	margin: auto;
}

#trainer .view div img {
	object-fit: cover;
	cursor: pointer;
}

#trainer .view_box {
	display: flex;
	padding-top: 20px;
	padding-bottom: 20px;
	width: 1230px;
}

#trainer .view {
	display: inline-flex;
	width: 100%;
	height: 300px;
}

#trainer .view_main {
	width: 50%;
	height: 101%;
	padding: 3px;
}

#trainer .view_main img {
	width: 100%;
	height: 100%;
	border-radius: 5% 0 0 5%;
}

#trainer .view_sub1 {
	width: 25%;
	height: 100%;
	margin-right: 6px;
}

#trainer .view_sub1 img {
	width: 100%;
	height: 50%;
	padding: 3px;
}

#trainer .view_sub2 {
	width: 25%;
	height: 100%;
}

#trainer .view_sub2 img {
	width: 100%;
	height: 50%;
	padding: 3px;
}

#trainer .nav_box {
	width: 1230px;
	height: 50px;
	display: inline-flex;
	justify-content: space-between;
	padding-top: 20px;
	padding-left: 10px;
	top: 0;
	background: #fcfcfc;
	border-bottom: solid 2px #77777770;
}

#trainer ul {
	margin: 0;
	list-style: none;
	display: inline-flex;;
}

#trainer .navBar ul li {
	font-size: 16px;
	font-family: Microsoft YaHei, Microsoft YaHei-Normal;
	font-weight: Normal;
	text-align: center;
	color: #777777;
	margin-right: 20px;
}

#trainer a.on {
	color: #009dff;
	box-shadow: inset 0 -3px 0 #009dff;
	padding-bottom: 15px;
}

#trainer .button {
	width: 100px;
}

#trainer .button img {
	width: 30px;
	height: 30px;
	margin-right: 10px;
}

#trainer .main_box {
	width: 700px;
	margin-left: 30px;
}

#trainer .profile{
	display: inline-flex;
}

#trainer .profile_img img{
	width: 250px;
    height: 250px;
    border-radius: 50%;
    border: 3px solid #c1c1c1;
}

#trainer .profile_contents{
    margin-left: 50px;
}

#trainer .fix_box {
	width: 300px;
	height: 400px;
	position: absolute;
	top: 600px;
	left: 1200px;
	background-color: #040303c7;
	z-index: 10;
	text-align: center;
	color: white;
}

#trainer .fix_box img {
	width: 250px;
	height: 200px;
	margin: 20px 0;
}

#trainer .fix_box a {
	width: 250px;
	height: 30px;
	margin: auto;
	margin-top: 50;
	padding-top: 10px;
	border: solid 1px #77777770;
	display: block;
	color: white;
	cursor: pointer;
}

#trainer .trainer {
	display: inline-flex;
	width: 300px;
	height: 110px;
	padding: 10px;
	border: solid 1px #77777770;
}

#trainer .trainer div img {
	width: 100px;
	height: 100px;
	margin-right: 20px;
}

#trainer .trainer_Tag{
	display: inline-flex;
	flex-wrap: wrap;
}


#trainer .trainer_Tag span {
		border-radius: 5px;
		padding: 3px;
		text-align: center;
		margin: 2px;
		background-color: grey;
	}

#trainer #map {
	width: 600px;
	height: 350px;
}

#trainer .img_board {
	width: 100%;
	height: 100%;
	z-index: 100;
	background-color: #000000cc;
	position: fixed;
	top: 0;
	left: 0;
	display: none;
	justify-content: center;
}

#trainer .gym_img {
	width: 50%;
	height: 70%;
	margin-top: 100px;
}

#trainer .gym_img img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

#trainer .x_button{
	position: relative;
	-webkit-appearance: none;
	border-radius: 0;	
	border: 0;
	width: 50px;
	height: 50px;
	cursor: pointer;
	top: 5%;
    left: 12%;
	background-color:  #77777700;
}

#trainer .x_button:after,
#trainer .x_button:before{
	content: "";
	display: block;
	position: absolute;
	top: 20px;
	left: 5px;	
	width: 40px;
	height: 5px;
	border-radius: 2px;
	background: #fcfcfc;
}
#trainer .x_button:after{
	transform: rotate(45deg);
}
#trainer .x_button:before{
	transform: rotate(-45deg);
}

#trainer .left_button {
	width: 0;
	height: 0;
	border-top: 20px solid transparent;
	border-bottom: 20px solid transparent;
	border-right: 30px solid #fcfcfc;
	position: relative;
	right: 10%;
	top: 50%;
	cursor: pointer;
}

#trainer .right_button {
	width: 0;
	height: 0;
	border-top: 20px solid transparent;
	border-bottom: 20px solid transparent;
	border-left: 30px solid #fcfcfc;
	position: relative;
	left: 10%;
	top: 50%;
	cursor: pointer;
}
</style>
	
	<script>
		
		// 이미지 전체보기 함수
		function board(index) {
			$('#hidden').css("display", 'flex');
			$('body').css("overflow", "hidden");
			document.getElementById("gym_img").src = gymImg[index];
		}

		// 전체보기 종료 함수
		function exit() {
			$('#hidden').css("display", 'none');
			$('body').css("overflow", "");
		}
		
		
		// 이미지 전환 스크립트
		var gymImg = new Array();
		var imgleng = ${tImglist.size()};
		var imglist = ${tImgString};
		
		
		for (var i = 0; i < imgleng; i++) {
			gymImg[i] = "/ConnectGym/resources/images/gym/" + imglist[i];
		}
		
		var i = 0;
		
		function left() {
			i--;
			if(i < 0) i = imgleng - 1;
			document.getElementById("gym_img").src = gymImg[i];
			return false;
		}
		
		function right() {
			i++;
			if(i > imgleng - 1) i=0;
			document.getElementById("gym_img").src = gymImg[i];
			return false;
		}
	</script>
	
	<script>
		//트레이너 태그 스플릿함수
		function splitTag(tags,num) {
			var tag_arr = tags.split(',');
			var tagHtml = '';
			for (var i = 0; i < tag_arr.length; i++) {
				tagHtml += '<span>' + tag_arr[i] + '</span>';
			}
			document.getElementById('trainer_tag_'+num).innerHTML = tagHtml;
		}
	</script>
	

    <jsp:include page="../header.jsp" />
    
    <div id="trainer">
    
	    <div class="view_box">
	    
	    	<div class="view">
	    		
	    		<div class="view_main">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${tImglist.get(0) }" onclick="board(0)" />
	    		</div>
	    		
	    		<div class="view_sub1">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${tImglist.get(1) }" onclick="board(1)"/>
	    			<img alt="" src="/ConnectGym/resources/images/gym/${tImglist.get(2) }" onclick="board(2)"/>
	    		</div>
	    		
	    		<div class="view_sub2">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${tImglist.get(3) }" onclick="board(3)"/>
	    			<img alt="" src="/ConnectGym/resources/images/gym/${tImglist.get(4) }" onclick="board(4)"/>
	    		</div>
	    		
	    	</div>
	    	
	    </div>
	    
		<!-- view_box 이미지 모달 팝업 -->
	    <div class="img_board" id="hidden">
    	
    		<div class="left_button" onclick="left()"> </div>
    		
    		<div class="gym_img">
    			<img id="gym_img" src="/ConnectGym/resources/images/gym/${tImglist.get(0) }" />
    		</div>
    		
 			<button class="x_button" type="button" onclick="exit()"></button>
 			
			<div class="right_button" onclick="right()"> </div>
    	</div>
    	
    
    	<div class="nav_box">
    	
	    	<div class="navBar">
	    	
	    		<ul>
					<li><a href="#">후&nbsp;기</a></li>			
					<li><a href="#">소&nbsp;개</a></li>
					<li><a href="#">프로그램</a></li>
					<li><a href="#">이용가격</a></li>
					<li><a href="#">스케줄</a></li>
					<li><a href="#">센터정보</a></li>
					<li><a href="#">위&nbsp;치</a></li>
				</ul>
				
	    	</div>
	    	
	    	<div class="button">
	    	
	    		<img src="/ConnectGym/resources/images/test/top.png">
	    		<img src="/ConnectGym/resources/images/test/top.png">
	    		
	    	</div>
	    	
    	</div>
    	
    	
    	<div class="main_box">
    	
    		<br/>
    		<br/>
    		<br/>
    		
    			<div class="profile">
    			
    				<div class="profile_img">
    					<img src="/ConnectGym/resources/images/test/profile_default.png" />
    				</div>
    				
    				<div class="profile_contents">
    		
    		<br/>		
    					<h1>${tmdto.memNick }</h1>
    		<br/>			
    					<h3>${tmdto.trComment }</h3>
    		<br/>
    		<br/>			
    					<h2>전문분야</h2>
    					<p>${tmdto.trTag }</p>
    					
    				</div>
    				
    			</div>
    		
    		<br/>
    		<br/>
    		<br/>
    		
    		
    		<br id="center_info" />
    		<br/>
    		<br/>
    		<br/>
    		
	    		<h2>센터 소개</h2>
	    		<br/>
	    		
    		<br id="center_time" />
    		<br/>
    		<br/>
    		<br/>
    		
	    		<h2>운영 시간</h2>
	    		<br/>
	    		
    		<br id="center_trainer" />
    		<br/>
    		<br/>
    		<br/>
    			
    			<h2>상담 가능한 트레이너</h2>
    			<br />
    			
		    		<div class="trainer_box">
			    	
		    		</div>
    		
    		<br id="center_Addr" />
    		<br/>
    		<br/>
    		<br/>
    		
    			<h2>위치</h2>
    			<br />
    			
    			<div>
    				<p></p>
    			</div>
    			<br />
    			
    			<div id="map">
    			
    			</div>
    			
    	
    	</div>
    	
    	
    	
    	<div class="fix_box">
    	
    		<img src="/ConnectGym/resources/images/gym/${tImglist.get(0) }">
    		<h2></h2>
    		
	    	<a href="tel:">전화하기</a>
    		
    	</div>
    	
    	
    	
    </div>
    
    <script type="text/javascript">
	
    	// 아래 화면 이동시 상단 고정
		$(function(){
			
			$(window).scroll(function(){  //스크롤하면 아래 코드 실행
				
			       var num = $(this).scrollTop();  // 스크롤값
			       
			       if( num > 445 ){  // 스크롤을 440이상 했을 때
			          $(".nav_box").css("position","fixed");
			          $(".fix_box").css("position","fixed").css("top","150px");
			       }else{
			           $(".nav_box").css("position","");
			           $(".fix_box").css("position","absolute").css("top","600px");
			       }
			});
		});
    	
	</script>
	
	
	<!--  카카오 지도 API	-->
	<script
	
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d40887ab9eb7314e8393a3af3aa2cc7&libraries=services"
	>
	
	</script>
	
	<script>
	
	      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
	        mapOption = {
	          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	          level: 3 // 지도의 확대 레벨
	        };
	
	      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	      var map = new kakao.maps.Map(mapContainer, mapOption);
	      
	      // 주소-좌표 변환 객체를 생성합니다
	      var geocoder = new kakao.maps.services.Geocoder();

	      // 주소로 좌표를 검색합니다
	      geocoder.addressSearch(''', function(result, status) {

	    	    // 정상적으로 검색이 완료됐으면 
	    	     if (status === kakao.maps.services.Status.OK) {

	    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	    	        // 결과값으로 받은 위치를 마커로 표시합니다
	    	        var marker = new kakao.maps.Marker({
	    	            map: map,
	    	            position: coords
	    	        });


	    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    	        map.setCenter(coords);
	    	    } 
	    	});   
	      
	</script>
	
	
    
    <jsp:include page="../footer.jsp" />