<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
// 	배너 전환 함수
	function circle(num) {
		$('.banner > img').attr('src','/ConnectGym/resources/test_img/main' + num + '.jpg')
		$('.banner_button > div').css('background', 'white')
		$('.banner_button_circle' + num).css('background', 'black')
	}
	
	$(function() {
		$('#searchBox').autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "/ConnectGym/mainSearch.do",
					type : "post",
					data : {
						"search" : $("#searchBox").val(),
						"flag" : $("#selectFlag").val()
					},
					success : function(responseData) {
// 						var data = JSON.parse(responseData);
// 						response($.map(data, function(item) {
// 							//for each 문처럼 data자체를 하나씩 꺼내는데 그게 item!!!!!
// 							return {
// 								//표시되는값
// 								label : item.country_name,
// 								//value로 저장되는값 
// 								value : item.country_id
// 							};
// 						}))
						console.log(responseData);
					},
					error : function() {
						console.log(xhr.status);
					}
				});//ajax							
			},
			select : function(event, ui) {
// 				 var selectedval = ui.item.value;
// 				//위에서 저장된 value가 뜸!!!!!!!!!!!!!!!!!
// 				console.log('선택된값1:' + selectedval);
// 				$.ajax({
// 					url : "/spring/selectedAjax",
// 					type : "get",
// 					data : {
// 						"val" : selectedval
// 					},
// 					success : function(data) {
// 						$('#selectedAjax').text(data);
// 					},
// 					error : function() {
// 						alert("통신에 실패했습니다.");
// 					} 
// 				});//ajax 

			}
		});
	});
	
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="main" id="main">

		<div class="info">
			
			<div class="info_icon">
				<img src="/ConnectGym/resources/images/test/tel_icon.png"/>
			</div>
			<div>
				<p>고객센터 : 1588-3082</p>
				<p>운영시간 : 09:00~17:00</p>
			</div>
		</div>
		
	
		<div class="banner">
			<img src="/ConnectGym/resources/images/test/main1.jpg"/>
			
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
					<img src="/ConnectGym/resources/images/test/top.png"/>
					<p>TOP 트레이너</p>
				</div>
				
				<div class="top_img">
					<!-- 테스트용 링크 --><a href="/ConnectGym/gym?gymNo=4"><img src="/ConnectGym/resources/images/test/trainer1.jpg"/></a>
					<!-- 테스트용 링크 --><a href="/ConnectGym/trainer?memNo=8"><img src="/ConnectGym/resources/images/test/trainer2.jpg"/></a>
					<img src="/ConnectGym/resources/images/test/trainer3.jpg"/>
				</div>
			</div>

			<div class="search">
				<div>
					<select id="selectFlag">
						<option value="gym">피트니스센터</option>
						<option value="trainer">트레이너</option>
					</select>
					<input type="text" size="100" id="searchBox"/>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>