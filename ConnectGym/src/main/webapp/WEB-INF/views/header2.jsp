<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/ConnectGym/resources/css/mycss.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Header</title>

</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <a class="navbar-brand" href="/ConnectGym/"><img src="/ConnectGym/resources/images/material/top-logo.png" style="width:280px; height:100px;"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    <div class="col-md-6 col-md-offset-3">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">메인</a></li>
	        <li><a href="#">커짐이란?</a></li>
	        <li><a href="/ConnectGym/search">검색</a></li>
	        <li><a href="#">예약</a></li>
	        <li><a href="/ConnectGym/board" class="comu">커뮤니티</a></li>
	    	<li><c:if test="${member == null }"><a href="login">로그인</a></c:if></li>
	       	<li><c:if test="${member == null }"><a href="selectjoin">회원가입</a></c:if></li>
	       	<li>
				<c:if test="${member != null }">
					<p>${member.memNick }님 안녕하세요.</p>
				</c:if>				
			</li>
			<li><c:if test="${member != null }"><a href="logout">로그아웃</a></c:if></li>
	      </ul>
	    </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>