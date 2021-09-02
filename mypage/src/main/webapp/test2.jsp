<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


// 기본 문서 
 String right =  "/views/aaa" ;
// String right2 =  "/views/aaa2" ;   
 





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
    height:600px;

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
			<%@ include file="/views/Top.jsp"%>
		</div>
					<!-- 근에 왜 여기서는 .jsp가 붇는거임? 인크루드 할때는 .jsp까지 넣어야한다고 하신다. -->

		<div class="two">
		
		<div style="padding-left: 9%; display: inline-block; ">   

		
			<div class="left"><div style="font-size: 20px;">
			
					<strong>마이 페이지 </strong>
				</div>
				
				<div>
				<br><br>
				

					 
					 
					<a style="text-decoration: none; color: black;" href="/gd/test2.jsp?right=/views/aaa">경매 내역</A><br> <br> 
				    <a style="text-decoration: none; color: black;" href="/gd/test2.jsp?right=/views/bbb">입찰/낙찰</a><br> <br>
					<a style="text-decoration: none; color: black;" href="/gd/test2.jsp?right=/views/ccc">유찰/취소</a><br> <br> <br> 
					
					<a style="text-decoration: none; color: black;" href="/gd/test2.jsp?right=/views/ddd">찜목록</a> <br> <br><br> 
					 
					<a style="text-decoration: none; color: black;" href="마이 포인트.jsp">마이 포인트</a><br><br> 
					<a style="text-decoration: none; color: black;" href="충전포인트.jsp">충전포인트</a><br><br>
					<a style="text-decoration: none; color: black;" href="사용내역.jsp">사용내역</a><br><br><br> 
					
					
					
					<a style="text-decoration: none; color: black;" href="가입 정보.jsp">회원정보 수정</a><br> <br> 
					<a style="text-decoration: none; color: black;" href="가입 정보.jsp">회원 탈퇴</a><br> <br> <br>
					
				</div>
				
				
				
				
				
				
				</div>

			<div class="right">right
				
				<jsp:include page="<%=right+\".jsp\" %>"></jsp:include>   <!-- 요것도 마찬가지 -->
				<%-- <jsp:include page="<%=right2+\".jsp\" %>"></jsp:include> --%>

			</div>



			<div class="three">three

				<%@ include file="/views/Bottom.jsp"%>
			</div>


		</div>

	</div>
</body>
</html>