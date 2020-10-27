<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    
    #gym{
    	width: 65%;
    	margin: auto;
    }
    
    #gym .view_box{
    	display: flex;
    	padding-top: 20px;
    }
    
    #gym .view{
    	display: inline-flex;
    	width: 100%;
    	height: 300px;
    }
    
	#gym .view_main{
		width: 50%;
		height: 101%;
		padding: 3px;
	}
	
	#gym .view_main img{
		width: 100%;
		height: 100%;
		border-radius: 5%;
	}
	
	#gym .view_sub1{
		width: 25%;
		height: 100%;
		margin-right: 6px;
	}
	
	#gym .view_sub1 img{
		width: 100%;
		height: 50%;
		padding: 3px;
		border-radius: 10%;
	}
	
	#gym .view_sub2{
		width: 25%;
		height: 100%;
	}
	
	#gym .view_sub2 img{
		width: 100%;
		height: 50%;
		padding: 3px;
		border-radius: 10%;
	}
	
	#gym .nav_box{
		width: 1230px;
		height: 50px;
		display: inline-flex;
		justify-content: space-between;
		padding-top: 40px;
		padding-left: 10px;
		top: 0;
		background: #fcfcfc;
		border-bottom: solid 2px #77777770;
	}
	
	#gym ul{
	margin: 0;
    list-style: none;
    display: inline-flex;;
	}
	
	#gym .navBar ul li{
		font-size: 16px;
		font-family: Microsoft YaHei, Microsoft YaHei-Normal;
		font-weight: Normal;
		text-align: center;
		color: #777777;
		margin-right: 20px;
	}
	
	#gym a.on{
		color: #009dff;
		box-shadow: inset 0 -3px 0 #009dff; 
		padding-bottom: 15px;
	}
	
	#gym .button{
		width: 100px;
	}
	
	#gym .button img{
		width: 30px;
		height: 30px;
		margin-right: 10px;
	}
	
	#gym .fix_box{
		width: 300px;
		height: 400px;
		position: absolute;
		top: 600px;
		right: 20%;
		background-color: #040303c7;
		display: flex;
		z-index: 10;
	}
	
	#gym .fix_box img{
		width: 250px;
		height: 200px;
		margin: auto;
   	 	margin-top: 20px;
	}
	
	</style>
	
	

    <jsp:include page="../header.jsp" />
    
    <div id="gym">
    
	    <div class="view_box">
	    
	    	<div class="view">
	    		
	    		<div class="view_main">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${list.get(0) }" />
	    		</div>
	    		
	    		<div class="view_sub1">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${list.get(1) }" />
	    			<img alt="" src="/ConnectGym/resources/images/gym/${list.get(2) }" />
	    		</div>
	    		
	    		<div class="view_sub2">
	    			<img alt="" src="/ConnectGym/resources/images/gym/${list.get(3) }" />
	    			<img alt="" src="/ConnectGym/resources/images/gym/${list.get(4) }" />
	    		</div>
	    		
	    	</div>
	    	
	    </div>
    
    	<div class="nav_box">
	    	<div class="navBar">
	    		<ul>
					<li><a href="#">센터소개</a></li>			
					<li><a href="#">이용가격</a></li>
					<li><a href="#">이용정보</a></li>
					<li><a href="#">운영시간</a></li>
					<li><a href="#">바로가기</a></li>
					<li><a href="#">코 &nbsp;치</a></li>
					<li><a href="#">위 &nbsp;치</a></li>
				</ul>
	    	</div>
	    	
	    	<div class="button">
	    		<img src="/ConnectGym/resources/images/test/top.png">
	    		<img src="/ConnectGym/resources/images/test/top.png">
	    	</div>
    	</div>
    	
    	
    	<div class="main_box">
    	
    	
    		<br/>
    		<br/>
    		<br/>
    		<br/>
    		<h1>투엑스휘트니스 분당점</h1>
    		<br/>
    		<p>경기도 성남시 분당고 정자일로 177 분당인텔리지2 3F</p>
    		<br/>
    		<p>서울 강남권 및 유수의 지역에 16개의 지점을 직영으로 운영되는 투엑스휘트니스의 분당정자역점 입니다.</p>
    		<br/>
    		<p>분당선/신분당선 정자역에서 도보 5분거리의 주상복합 인텔리지2에 위치해있습니다.</p>
    		<br/>
    		<br/>
    		<br/>
    		<br/>
    		<h1>투엑스휘트니스 분당점</h1>
    		<br/>
    		<p>경기도 성남시 분당고 정자일로 177 분당인텔리지2 3F</p>
    		<br/>
    		<p>서울 강남권 및 유수의 지역에 16개의 지점을 직영으로 운영되는 투엑스휘트니스의 분당정자역점 입니다.</p>
    		<br/>
    		<p>분당선/신분당선 정자역에서 도보 5분거리의 주상복합 인텔리지2에 위치해있습니다.</p>
    		<br/>
    		<br/>
    		<br/>
    		<br/>
    		<h1>투엑스휘트니스 분당점</h1>
    		<br/>
    		<p>경기도 성남시 분당고 정자일로 177 분당인텔리지2 3F</p>
    		<br/>
    		<p>서울 강남권 및 유수의 지역에 16개의 지점을 직영으로 운영되는 투엑스휘트니스의 분당정자역점 입니다.</p>
    		<br/>
    		<p>분당선/신분당선 정자역에서 도보 5분거리의 주상복합 인텔리지2에 위치해있습니다.</p>
    		<br/>
    		<br/>
    		<br/>
    		<br/>
    		
    		
    		
    	
    	</div>
    	
    	
    	
    	<div class="fix_box">
    		<img src="/ConnectGym/resources/images/gym/${list.get(0) }">
    	</div>
    </div>
    
    <script type="text/javascript">
	
	$(function(){
		$(window).scroll(function(){  //스크롤하면 아래 코드 실행
		       var num = $(this).scrollTop();  // 스크롤값
		       if( num > 430 ){  // 스크롤을 36이상 했을 때
		          $(".nav_box").css("position","fixed");
		          $(".fix_box").css("position","fixed").css("top","150px");
		       }else{
		           $(".nav_box").css("position","");
		           $(".fix_box").css("position","absolute").css("top","600px");
		       }
		  });
		});
	</script>
    
    <jsp:include page="../footer.jsp" />