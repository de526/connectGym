<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	

<script type="text/javascript">
	
// 	배너 전환 함수
	function circle(num) {
		$('.banner > img').attr('src','/ConnectGym/resources/test_img/main' + num + '.jpg')
		$('.banner_button > div').css('background', 'white')
		$('.banner_button_circle' + num).css('background', 'black')
	}
	
</script>

	<jsp:include page="header.jsp" />
	
	<div class="main" id="main">
	
		<div class="info">
			<div class="info_icon">
				<img src="/ConnectGym/resources/test_img/tel_icon.png"/>
			</div>
			<div>
				<p>고객센터 : 1588-3082</p>
				<p>운영시간 : 09:00~17:00</p>
			</div>
		</div>
		
	
		<div class="banner">
			<img src="/ConnectGym/resources/test_img/main1.jpg"/>
			
			<div class="banner_button">
				<div class="banner_button_circle1" onclick="circle(1)">
				</div>
				<div class="banner_button_circle2" onclick="circle(2)">
				</div>
			</div>
		</div>
		
		<div class="contents">
			<div class="top">
				<div class="top_title">
					<img src="/ConnectGym/resources/test_img/top.png"/>
					<p>TOP 트레이너</p>
				</div>
				
				<div class="top_img">
					<img src="/ConnectGym/resources/test_img/trainer1.jpg"/>
					<img src="/ConnectGym/resources/test_img/trainer2.jpg"/>
					<img src="/ConnectGym/resources/test_img/trainer3.jpg"/>
				</div>
			</div>

			<div class="search">
				<div>
					<select>
						<option>피트니스센터</option>
						<option>트레이너</option>
					</select>
					<input type="text" size="100" />
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
