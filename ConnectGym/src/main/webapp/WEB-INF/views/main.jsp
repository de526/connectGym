<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<jsp:include page="header.jsp" />
	
<style>

.content{
	display: inline-flex;
	width: 1920px;
	height: 920px;
	position: relative;
	top: -120px;
}

.div1{
	width: 300px;
}

.banner{
    width: 500px;
    background: #fee517;
    z-index: 1;
}

.banner img{
	width: 500px;
	height: 500px;
	margin-top: 220px;
}

.banner_button{
	display: inline-flex;
	width: 500px;
	justify-content: center;
	margin-top: 100px;
}


.banner_button div{
	width: 10px;
	height: 10px;
	border-radius: 50%;
	margin: 3px;
}

.banner_button div{
	cursor: pointer;
}

.banner_button_circle1{
	background: black;
}

.banner_button_circle2{
	background: white;
}





</style>

<script type="text/javascript">
	
	
	function circle(num) {
		$('.banner > img').attr('src','/ConnectGym/resources/test_img/main' + num + '.jpg')
		$('.banner_button > div').css('background', 'white')
		$('.banner_button_circle' + num).css('background', 'black')
	}
	
	
</script>
	
	<div class="content">
	
		<div class="div1">
		
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
		
	</div>
	
	<jsp:include page="footer.jsp" />
