<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
* {
	background: rgba(242, 242, 242, 0.2);
	text-shadow: 0px 5px 20px 0px rgba(0, 0, 0, 0.15);
}

#footer .wrap {
	display: table;
	width: 1920px;
	height: 430px;
	text-align: center;
}

#footer .text {
	opacity: 0.08;
	font-size: 100px;
	font-family: Tahoma, Tahoma-Bold;
	font-weight: 900;
	color: #777777;
	position: relative;
	left: 10px;
	top: 45px;
}

#footer .box {
	width: 1100px;
	height: 350px;
	opacity: 0.85;
	background: #000000;
	border-radius: 15px;
	margin: 0 auto;
	box-shadow: 10px 10px 10px 0px rgba(0, 0, 0, 0.71);
	position: relative;
}

li {
	margin: 0;
	padding: 0;
	list-style: none;
}

#footer.info li {
	display: inline-block;
	vertical-align: middle;
	float: left;
	width: 33.333%;
	font-size: 15px;
	font-weight: 600;
	color: #595c6d;
	line-height: 20px;
	letter-spacing: -0.5px;
	text-align: left;
}
#footer .info li.fi_address {
    margin-bottom: 40px;
}
#footer .f_btn {
    display: inline-block;
    vertical-align: middle;
    position: absolute;
    right: 190px;
    top: 90px;
}
</style>
	<footer id="footer">
		<div class="wrap">
			<div class="text">CONNECT GYM</div>
			<div class="box">
				<div class="info">
					<ul>
						<li><strong>COMPANY</strong> <span class="cm">(주)헤드트리</span>
						</li>
						<li class="fi_address"><strong>ADDRESS</strong> <span>서울특별시
								마포구 양화로10길 19, 상록빌딩 2층 202호</span></li>
						<li><strong>BUSINESS LICENSE</strong> <span>332-81-00662</span>
						</li>
						<li><strong>TEL</strong> <span><a
								href="tel:0264044224">02-6404-4224</a></span></li>
						<li><strong>E-MAIL</strong> <span><a
								href="mailto:info@newbird.co.kr">info@newbird.co.kr</a></span></li>
					</ul>
				</div>
				<div class="f_btn">
					<ul>
						<li><a href="../contact/" class="btn big t2 arrow">REQEUST</a></li>
						<li><a href="#location" class="btn big arrow">LOCATION</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>