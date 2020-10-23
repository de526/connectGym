<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<jsp:include page="header.jsp" />
	
<style>

.main{
	display: inline-flex;
	width: 1920px;
	height: 920px;
	position: relative;
	top: -120px;
}

#main .info{
	width: 300px;
	display: inline-flex;
	margin-top: 800px;
	justify-content:center;
	font-size: 15px;
	font-family: Helvetica, Helvetica-Normal;
	font-weight: bold;
}

#main .info_icon img{
	width: 30px;
	height: 30px;
	margin-top: 5px;
	margin-right: 5px;
	
}

#main .banner{
    width: 500px;
    background: #fee517;
    z-index: 1;
}

#main .banner img{
	width: 500px;
	height: 500px;
	margin-top: 220px;
}

#main .banner_button{
	display: inline-flex;
	width: 500px;
	justify-content: center;
	margin-top: 100px;
}


#main .banner_button div{
	width: 10px;
	height: 10px;
	border-radius: 50%;
	margin: 3px;
}

#main .banner_button div{
	cursor: pointer;
}

#main .banner_button_circle1{
	background: black;
}

#main .banner_button_circle2{
	background: white;
}

#main .contents{
}

#main .top{
	margin-top: 200px;
	margin-left: 100px;
	width: 900px;
	height: 400px;
}

#main .top_title{
	display: inline-flex;
	margin-bottom: 10px;
}

#main .top_title img{
	width: 20px;
	height: 20px;
	margin-right: 5px;
}

#main .top_img{
	display: inline-flex;
	width: 1000px;
	height: 300px;
}

#main .top_img img{
	width: 300px;
	height: 300px;
	margin-right: 20px;
}

#main .search{
	height: 400px;
	text-align: center;
	padding-top: 100px;
}

#main .search div select{
	width: 200px;
	height: 40px;
	margin-left: 100px;
}

#main .search div input{
	width: 400px;
	height: 40px;
}








</style>

<script type="text/javascript">
	
	
	function circle(num) {
		$('.banner > img').attr('src','/ConnectGym/resources/test_img/main' + num + '.jpg')
		$('.banner_button > div').css('background', 'white')
		$('.banner_button_circle' + num).css('background', 'black')
	}
	
	
</script>
	
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
