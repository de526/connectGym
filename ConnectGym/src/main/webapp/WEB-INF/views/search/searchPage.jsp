<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="wrap">
		<div class="content-box">
			<div id="searchBar">
				<select>
					<option>피트니스센터</option>
					<option>트레이너</option>
				</select> <input type="text" id="serachBox"> 
				<input type="button" onclick="get_searchBox()">
			</div>

			<div id="tagBar">
				<form></form>
			</div>
			
			<div id="list"></div>
		</div>

	</div>
	<script>
		//태그 전체 출력하기 , 체크박스 설정해서 tagBar안에 넣기
		var tag_keyword = [ '여자', '남자', '다이어트', '근력증진', '바디프로필', '대회준비', '영어',
				'바른체형', '기초체력', '벌크업', '멸치탈출' ];
		var tagContent = '';

		for (var i = 0; i < tag_keyword.length; i++) {
			tagContent += '<input type="checkbox" name="checkbox_tag" class="cls_tag" id="tag_'	+ tag_keyword[i]
					+ '" value="'+ tag_keyword[i]+ '" onchange="get_searchList()">';
			tagContent += '<label for="tag_'+tag_keyword[i]+'">';
			tagContent += '<span>' + tag_keyword[i] + '</span> </label>';
		}
		document.getElementById('tagBar').innerHTML = tagContent;
	</script>
	<script>	
		var searchValue = null;//button눌렀을때 검색값 저장하는 변수
		function get_searchBox(){
			searchValue = document.getElementById("serachBox").value;
			//변수값저장하고 태그확인하면서 리스트 가져오기
			get_searchList();
		}

		function get_searchList() {			
			var tags = document.getElementsByName("checkbox_tag");
			var tags_arr = new Array();
			for (var i = 0; i < tags.length; i++) {
				if (tags[i].checked == true) {
					tags_arr.push(tags[i].value);
				}
			}
			//console.log(tags_arr);
			//console.log(searchValue);

			//체크된 배열이랑 검색값 가지고 ajax 다녀오기~
			$.ajax({
				url : "/ConnectGym/searchList.do",
				type : "post",
				data : {
					"tags" : tags_arr,
					"search":searchValue
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
					alert("통신에 실패했습니다.");
				}
			}); // ajax 끝~
		}
	</script>


</body>
</html>