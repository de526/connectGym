<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    
    <style>
#gym {
	width: 65%;
	margin: auto;
}

#gym img {
	object-fit: cover;
}

#gym .view_box {
	display: flex;
	padding-top: 20px;
	padding-bottom: 20px;
	width: 1230px;
}

#gym .view {
	display: inline-flex;
	width: 100%;
	height: 300px;
}

#gym .view_main {
	width: 50%;
	height: 101%;
	padding: 3px;
}

#gym .view_main img {
	width: 100%;
	height: 100%;
	border-radius: 5%;
}

#gym .view_sub1 {
	width: 25%;
	height: 100%;
	margin-right: 6px;
}

#gym .view_sub1 img {
	width: 100%;
	height: 50%;
	padding: 3px;
	border-radius: 10%;
}

#gym .view_sub2 {
	width: 25%;
	height: 100%;
}

#gym .view_sub2 img {
	width: 100%;
	height: 50%;
	padding: 3px;
	border-radius: 10%;
}

#gym .nav_box {
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

#gym ul {
	margin: 0;
	list-style: none;
	display: inline-flex;;
}

#gym .navBar ul li {
	font-size: 16px;
	font-family: Microsoft YaHei, Microsoft YaHei-Normal;
	font-weight: Normal;
	text-align: center;
	color: #777777;
	margin-right: 20px;
}

#gym a.on {
	color: #009dff;
	box-shadow: inset 0 -3px 0 #009dff;
	padding-bottom: 15px;
}

#gym .button {
	width: 100px;
}

#gym .button img {
	width: 30px;
	height: 30px;
	margin-right: 10px;
}

#gym .main_box {
	width: 700px;
	margin-left: 30px;
}

#gym .fix_box {
	width: 300px;
	height: 400px;
	position: absolute;
	top: 600px;
	right: 20%;
	background-color: #040303c7;
	z-index: 10;
	text-align: center;
	color: white;
}

#gym .fix_box img {
	width: 250px;
	height: 200px;
	margin: 20px 0;
}

#gym .fix_box div {
	width: 250px;
	height: 30px;
	margin: auto;
	margin-top: 50;
	padding-top: 10px;
	border: solid 1px #77777770;
}

#gym .trainer {
	display: inline-flex;
	width: 300px;
	height: 110px;
	padding: 10px;
	border: solid 1px #77777770;
}

#gym .trainer div img {
	width: 100px;
	height: 100px;
	margin-right: 20px;
}

#gym #map {
	width: 600px;
	height: 350px;
}

#gym .img_board {
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

#gym .gym_img {
	width: 40%;
	height: 60%;
	margin-top: 150px;
}

#gym .gym_img img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

#gym .arrow-left {
	width: 0;
	height: 0;
	border-top: 20px solid transparent;
	border-bottom: 20px solid transparent;
	border-right: 30px solid #fcfcfc;
	position: relative;
	right: 300px;
	top: 450px;
}

#gym .arrow-right {
	width: 0;
	height: 0;
	border-top: 20px solid transparent;
	border-bottom: 20px solid transparent;
	border-left: 30px solid #fcfcfc;
	position: relative;
	left: 300px;
	top: 450px;
}
</style>
	
	<script>
		function board() {
			$('#hidden').css("display", 'flex');
			$('body').css("overflow", "hidden");
		}

		function exit() {
			$('#hidden').css("display", 'none');
			$('body').css("overflow", "");
		}
		
		var gymImg = new Array();
		var imgleng = ${imglist.size()};
		
		for (var i = 0; i < imgleng; i++) {
			var imgName = "${imglist.get(i)}";
			gymImg[i] = "/ConnectGym/resources/images/gym/" + imgName;
		}
		
		var i = 0;
		
		function left() {
			alert("dddd");
			i--;
			if(i < 0) i = imgleng - 1;
			document.getElementById("gym_img").src = gymImg[i];
		}
		
		function rignt() {
			i++;
			if(i > imgleng - 1) i=0;
			document.getElementById("gym_img").src = gymImg[i];
			return false;
		}
	</script>
	

    <jsp:include page="../header.jsp" />
    
    <div id="gym">
    
	    <div class="view_box">
	    
	    	<div class="view">
	    		
	    		<div class="view_main">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${imglist.get(0) }" onclick="board()" />
	    		</div>
	    		
	    		<div class="view_sub1">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${imglist.get(1) }" />
	    			<img alt="" src="/ConnectGym/resources/images/gym/${imglist.get(2) }" />
	    		</div>
	    		
	    		<div class="view_sub2">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${imglist.get(3) }" />
	    			<img alt="" src="/ConnectGym/resources/images/gym/${imglist.get(4) }" />
	    		</div>
	    		
	    	</div>
	    	
	    </div>
    
    	<div class="nav_box">
    	
	    	<div class="navBar">
	    	
	    		<ul>
					<li><a href="#center_info">센터소개</a></li>			
					<li><a href="#center_time">운영시간</a></li>
					<li><a href="#center_trainer">트레이너</a></li>
					<li><a href="#center_Addr">위 &nbsp;치</a></li>
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
    		
	    		<h1>${gdto.gymName }</h1>
	    		<br/>
	    		<p>${gdto.gymAddr }</p>
    		
    		<br id="center_info" />
    		<br/>
    		<br/>
    		<br/>
    		
	    		<h2>센터 소개</h2>
	    		<br/>
	    		<p>${gdto.gymInfo }</p>
	    		
    		<br id="center_time" />
    		<br/>
    		<br/>
    		<br/>
    		
	    		<h2>운영 시간</h2>
	    		<br/>
	    		<p>평일 ${gdto.gymWeekday }</p>
	    		
	    		<c:if test="${not empty gdto.gymSaturday }">
	    		<p>토요일 ${gdto.gymSaturday }</p>
	    		</c:if>
	    		
	    		<c:if test="${not empty gdto.gymSunday }">
	    		<p>일요일 ${gdto.gymSunday }</p>
	    		</c:if>
	    		
	    		<p>휴무일 ${gdto.gymHoliday }</p>
	    		
    		<br id="center_trainer" />
    		<br/>
    		<br/>
    		<br/>
    			
    			<h2>상담 가능한 트레이너</h2>
    			<br />
    			
	    		<c:forEach var="gmdto" items="${gmdto }" varStatus="i">
	    		
		    		<div class="trainer">
		    		
							<div class="trainer_${i.count}">
							
								<img src="/ConnectGym/resources/images/test/trainer${i.count}.jpg">
								
							</div>
							
							<div>
							
								<h3>${gmdto.memNick }</h3>
								<p>${gmdto.memInfo }</p>
								<h4>${gmdto.memTag }</h4>
								
							</div>
							
		    		</div>
	    		
				</c:forEach>
    		
    		<br id="center_Addr" />
    		<br/>
    		<br/>
    		<br/>
    		
    			<h2>위치</h2>
    			<br />
    			
    			<div>
    				<p>${gdto.gymAddr }</p>
    			</div>
    			<br />
    			
    			<div id="map">
    			
    			</div>
    			
    	
    	</div>
    	
    	
    	
    	<div class="fix_box">
    	
    		<img src="/ConnectGym/resources/images/gym/${imglist.get(0) }">
    		<h2>${gdto.gymName }</h2>
    		<div>전화하기</div>
    		
    	</div>
    	
    	<div class="img_board" id="hidden">
    	
    		<div class="arrow-left" onclick="left()"> </div>
    		
    		<div class="gym_img">
    			<img id="gym_img" src="/ConnectGym/resources/images/gym/${imglist.get(0) }" />
    		</div>
 
			<div class="arrow-right" onclick="right()"> </div>
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
	      geocoder.addressSearch('${gdto.gymAddr}', function(result, status) {

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