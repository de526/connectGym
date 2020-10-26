<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    
    #gym{
    	width: 100%;
    }
    
    #gym .view_box{
    	display: flex;
    }
    
    #gym .view {
    	display: inline-flex;
    	width: 65%;
    	height: 300px;
    	padding-top: 20px;
    	margin: auto;
    }
    
	#gym .view_main{
		width: 50%;
		height: 100%;
	}
	
	#gym .view_main img{
		width: 100%;
		height: 100%;
	}
	
	#gym .view_sub1{
		width: 25%;
		height: 100%;
	}
	
	#gym .view_sub1 img{
		width: 100%;
		height: 50%;
	}
	
	#gym .view_sub2{
		width: 25%;
		height: 100%;
	}
	
	#gym .view_sub2 img{
		width: 100%;
		height: 50%;
	}
	</style>

    <jsp:include page="../header.jsp" />
    
    <div id="gym">
    
	    <div class="view_box">
	    
	    	<div class="view">
	    		
	    		<div class="view_main">
	    			<img alt="" src="/ConnectGym/resources/gym_img/${list.get(0) }" />
	    		</div>
	    		
	    		<div class="view_sub1">
	    			<img alt="" src="/ConnectGym/resources/gym_img/${list.get(1) }" />
	    			<img alt="" src="/ConnectGym/resources/gym_img/${list.get(2) }" />
	    		</div>
	    		
	    		<div class="view_sub2">
	    			<img alt="" src="/ConnectGym/resources/gym_img/${list.get(3) }" />
	    			<img alt="" src="/ConnectGym/resources/gym_img/${list.get(4) }" />
	    		</div>
	    		
	    	</div>
	    	
	    </div>
    
    </div>
    
    <jsp:include page="../footer.jsp" />