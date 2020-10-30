<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"
	type="text/javascript"></script>

<style>
.cls_tag {
	display: none;
}

.on {
	color: blue;
	background-color: black;
}

.tag_label {
	border-radius: 5px;
	padding: 3px;
	text-align: center;
	margin: 10px;
	background-color: #ffffff;
}

.content-box {
	width: 65%;
	margin: 0 auto;
}

#searchBar {
	text-align: center;
}

.searchIcon {
	float: right;
}

#tagBox {
	width: 60%;
	/* 	height: 80px;  */
	border: 2px solid #D8D8D8;
	border-radius: 10px;
	background-color: #D8D8D8;
	padding: 10px;
	text-align: center;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	//서치값 입력하는곳에서 엔터누르면 값 넘어가게하는 함수
	function enter_check() {
		if (event.keyCode == 13) {
			get_searchBox();
		}
	}
	var searchValue = '';//button눌렀을때 검색값 저장하는 변수
	var flag = 'trainer'; //컨트롤러 보낼 변수 gym 아니면 trainer

	//트레이너,헬스장 버튼 누르면 리스트 바꾸기	
	function setFlag(selectflag) {
		flag = selectflag;
		get_searchList();
	}

	//체크박스 라벨 누르면 색 변하기~
	$(function() {
		get_searchList();
		$('label').click(function() {
			if ($(this).hasClass('on')) {
				$(this).removeClass('on')
			} else {
				$(this).addClass('on')
			}
		})
	})
</script>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<div class="wrap">
		<div class="content-box">

			<div id="searchBar">
				<input type="text" id="searchBox" size="30"
					onkeypress="enter_check()"> <input type="button"
					onclick="get_searchBox()" value="검색">

				<div class="searchIcon">
					<img src="/ConnectGym/resources/images/material/selectGym.png"
						onclick="setFlag('gym')" width="50" height="50"> <img
						src="/ConnectGym/resources/images/material/selectTra.png"
						onclick="setFlag('trainer')" width="50" height="50">
				</div>
			</div>
			<br /> <br />
			<hr />
			<br />
			<div id="tagBox">
				<!--태그 만들어지는곳-->
			</div>
			<br />
			<div id="searchList">
				<!--검색 리스트 뿌리는 곳-->
			</div>
		</div>
	</div>
	<script>
		//태그 전체 출력하기 , 체크박스 설정해서 tagBox안에 넣기
		var tag_keyword = [ '여성전문', '남성전문', '다이어트', '근력증진', '바디프로필', '대회준비',
				'영어', '바른체형', '벌크업', '기초체력', '멸치탈출', '헬린이', '중국어', '일본어', '요가',
				'크로스핏', '필라테스' ];
		var tagContent = '';

		for (var i = 0; i < tag_keyword.length; i++) {
			tagContent += '<input type="checkbox" name="checkbox_tag" class="cls_tag" id="tag_'
					+ tag_keyword[i]
					+ '" value="'
					+ tag_keyword[i]
					+ '" onchange="get_searchList()">';
			tagContent += '<label class="tag_label" for="tag_'+tag_keyword[i]+'">';
			tagContent += '<span>' + tag_keyword[i] + '</span> </label>';
		}
		document.getElementById('tagBox').innerHTML = tagContent;

		function get_searchBox() {
			searchValue = document.getElementById("searchBox").value;
			//변수값저장하고 태그확인하면서 리스트 가져오기
			get_searchList();
		}

		function get_searchList() {
			var checkedTag = [ '' ]; //체크된 태그 값 넣는 배열
			var tags = document.getElementsByName("checkbox_tag");
			//체크된거 배열에 넣기
			for (var i = 0; i < tags.length; i++) {
				if (tags[i].checked == true) {
					checkedTag.push(tags[i].value);
				}
			}
			//체크된 배열이랑 검색값 가지고 ajax 다녀오기~
			$.ajax({
				url : "/ConnectGym/searchList.do",
				type : "post",
				data : {
					"flag" : flag,
					"tags" : checkedTag,
					"search" : searchValue
				},
				cache : false,
				dataType : "text",
				success : function(result) {
					$('#searchList').html(result);
					//console.log(result);			
				}
			}); // ajax
		}
	</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>