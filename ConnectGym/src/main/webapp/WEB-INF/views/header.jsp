<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/ConnectGym/resources/css/mycss.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<head>
<meta charset="UTF-8">
<title>커짐</title>
<script type="text/javascript">
	$(function() {
		$('.navBar > ul > li > a').click(function() {
			$('.navBar > ul > li > a').removeClass()
				$(this).addClass('on')
		})
	})
	
	$(function() {
		$('.sign > ul > li > a').click(function() {
			$('.sign > ul > li > a').removeClass()
				$(this).addClass('on')
		})
	})
</script>
</head>
<body>
<div class="container">
	<div id="header">
		<div class="logo">
			<a href="/ConnectGym/">
				<img src="/ConnectGym/resources/css_img/top-logo.png">
			</a>
		</div>
		
		<div class="navBar">
			<ul>
				<li><a href="#">메인</a></li>			
				<li><a href="#">커짐이란?</a></li>
				<li><a href="#">검색</a></li>
				<li><a href="#">예약</a></li>
				<li><a href="#">커뮤니티</a></li>
			</ul>
		</div>
		
		<div class="sign">
			<ul>
				<li><a href="#">로그인</a></li>			
				<li><a href="#">회원가입</a></li>
			</ul>
		</div>
	</div>