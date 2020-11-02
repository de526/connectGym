<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">


<style>
.gymOne{
	display: inline-flex;
	border-top : 1px solid;
	width: 90%;
	height: 170px;
	justify-content: space-between;
	padding:20px;
}
.gymName{
	width: 500px;
}
.gymMainImg{
	
}

</style>

<!-- 태그밑에서 푸터까지 헬스장 리스트 뿌리기 -->

<c:forEach items="#{gymList}" var="gym">
	<div class="gymOne">
		
		<div class="gymName">
		<h2>
			<a href="/ConnectGym/gym?gymNo=${gym.gymNo}">${gym.gymName }</a>
		</h2>
		<br /> ${gym.gymInfo }<br /> ${gym.gymAddr }		
		<br>
				
		</div>
		<div class="gymMainImg">
		<img src="/ConnectGym/resources/images/gym/${gym.imgName}" width="150" height="150" >
		</div>
	</div>
</c:forEach>

