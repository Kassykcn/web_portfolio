<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


// 기본 문서 
 String right =  "/WEB-INF/views/aaa" ;
  
 





if(request.getParameter("right") != null && request.getParameter("right") != "") 
	right =  request.getParameter("right") ;




%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 1200px;
	
}

.one {
	width: 1200px;
	
	
}`

.two {
	width: 1200px;
	height: 600px;
	
}



.two .left {
	float: left;
	width: 250px;

	
}

.two .right {
	float: left;
	width: 950px;
    height:900px;

}

.two .right:after {
    clear:both;
	display:block;      
	
	
	
}


.three {
	width: 1200px;
	height: 150px;
	display:block;
	
}


</style>
</head>
<body>



	<div class="outer">


		<div class="one">
			<%@ include file="WEB-INF/views/Top.jsp"%>
		</div>
					

		<div class="two">
		
		<div style="padding-left: 9%; display: inline-block; ">   

		
			<div class="left"><div style="font-size: 20px;">
			
					<strong>마이 페이지 </strong>
				</div><br><br>
				
				<div>
				
				

					 
					 
					<a style="text-decoration: none; color: black;" href="/test2.jsp?right=/WEB-INF/views/aaa">경매 내역</A><br> <br> 
				    <a style="text-decoration: none; color: black;" href="/test2.jsp?right=/WEB-INF/views/bbb">입찰/낙찰</a><br> <br>
					<a style="text-decoration: none; color: black;" href="/test2.jsp?right=/WEB-INF/views/ccc">유찰/취소</a><br> <br> <br> 
					
					<a style="text-decoration: none; color: black;" href="/test2.jsp?right=/WEB-INF/views/ddd">찜목록</a> <br> <br><br> 
					 
					<a style="text-decoration: none; color: black;" href="마이 포인트.jsp">마이 포인트</a><br><br> 
					<a style="text-decoration: none; color: black;" href="충전포인트.jsp">충전포인트</a><br><br>
					<a style="text-decoration: none; color: black;" href="사용내역.jsp">사용내역</a><br><br><br> 
					
					
					
					<a style="text-decoration: none; color: black;" href="/test2.jsp?right=/WEB-INF/views/member/edit">회원정보 수정</a><br> <br> 
					<a style="text-decoration: none; color: black;" href="/test2.jsp?right=/WEB-INF/views/member/delete">회원 탈퇴</a><br> <br> <br>
					
				</div>
				
				
				
				
				
				
				</div>

			<div class="right" style="vertical-align: top;background-color: aqua;">				
				<jsp:include page="<%=right+\".jsp\" %>"></jsp:include>   <br><br><br>   <!-- 요것도 마찬가지 -->
				<%-- <jsp:include page="<%=right2+\".jsp\" %>"></jsp:include> --%>

			</div>
				


			<div class="three">
			
				<%@ include file="WEB-INF/views/Bottom.jsp"%>
			</div>


		</div>

	</div>
</body>
</html>