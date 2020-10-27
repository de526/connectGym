<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
<style>
.cls_tag {
	display: none;
}

.on {
	color: white;
	background-color: black;
}
.tag_label{
	border-radius: 5px;
	padding: 3px;
	text-align: center; 
	margin: 2px;
	background-color: #ffffff; 	
}
.content-box{
	width: 65%;
	margin: 0 auto;
}
#searchBar{
	text-align: center;
}
.searchIcon{
	float: right;
}
#tagBox{
	height:50px;
	border: 2px solid #D8D8D8;
	border-radius: 10px;
	background-color: #D8D8D8;
	padding: 10px;
	text-align: center;
}
</style>
<script type="text/javascript">
	//체크박스 라벨 누르면 색 변하기~
	$(function() {
		$('label').click(function() {
			if ($(this).hasClass('on')) {
				$(this).removeClass('on')
			} else {
				$(this).addClass('on')
			}
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="wrap">
		<div class="content-box">
			<div id="searchBar">			
				<input type="text" id="searchBox" size="30"> 
				<input type="button" onclick="get_searchBox()" value="검색">
				
				<div class="searchIcon">
					<img src="dd" onclick="">
					<img src="dd" onclick="">
				</div>
				 
			</div>
			
			<br/><hr/><br/>
			<div id="tagBox">
			</div>
			<br />
			<!-- 해당되는 트레이너/헬스장 리스트 가져오기 -->
			<jsp:include page="searchGym.jsp" />
			
		</div>

	</div>
	<script>
		//태그 전체 출력하기 , 체크박스 설정해서 tagBox안에 넣기
		var tag_keyword = ['여성전문','남성전문','다이어트','근력증진','바디프로필','대회준비','영어','바른체형','벌크업','기초체력','멸치탈출','헬린이','중국어','일본어','요가','크로스핏','필라테스'];
		var tagContent = '';

		for (var i = 0; i < tag_keyword.length; i++) {
			tagContent += '<input type="checkbox" name="checkbox_tag" class="cls_tag" id="tag_'	+ tag_keyword[i]
					+ '" value="'+ tag_keyword[i]
					+ '" onchange="get_searchList()">';
			tagContent += '<label class="tag_label" for="tag_'+tag_keyword[i]+'">';
			tagContent += '<span>' + tag_keyword[i] + '</span> </label>';
		}
		document.getElementById('tagBox').innerHTML = tagContent;
	</script>
	<script>
	
		var searchValue = null;//button눌렀을때 검색값 저장하는 변수
		function get_searchBox() {
			searchValue = document.getElementById("serachBox").value;
			//변수값저장하고 태그확인하면서 리스트 가져오기
			get_searchList();
		}

		function get_searchList() {

			var tags = document.getElementsByName("checkbox_tag");
			var checkedTag = new Array();
			for (var i = 0; i < tags.length; i++) {
				if (tags[i].checked == true) {
					checkedTag.push(tags[i].value);
				}
			}
			//console.log(checkedTag);
			//console.log(searchValue);

			//체크된 배열이랑 검색값 가지고 ajax 다녀오기~
			$.ajax({
				url : "/ConnectGym/searchList.do",
				type : "post",
				data : {
					"tags" : checkedTag,
					"search" : searchValue
				},
				dataType : "json",
				success : function(json) {
					console.log(json[0].gymNo)
					/* $.each(json,function(index,item){
						console.log(index)
						console.log(item.gymNo)
					}) */

				},
				error : function() {
					//alert("통신에 실패했습니다.");
				}
			}); // ajax 끝~
		}
	</script>

	<jsp:include page="../footer.jsp" />
</body>
</html>