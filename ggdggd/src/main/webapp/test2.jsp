<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


// 기본 문서 
 String right =  "/views/aaa" ;
// String right2 =  "/views/aaa2" ;   
 
//오전에 기록			
//여기서는 .jsp가 기본으로 설정했기때문에 aaa까지만 해놓은다.   스트링 선언 = 경로 




// 오후에 기록

// String right 부분에 하나를 더 출력을 해야하면 간단하게 right2라는 shring를 하나 더 추가하고


// 전달받은 문서

if(request.getParameter("right") != null && request.getParameter("right") != "") 
	right =  request.getParameter("right") ;

/*  if(request.getParameter("right2") != null && request.getParameter("right2") != "") 
	right2 =  request.getParameter("right2") ;  */


// 만약에 right가 null이고 "" 일때 right는 right를 받는다.
//이건 그니까 처음에 마이페이지를 들어갈때 right 영역에 빈 화면으로 출력하지 않기 위해서 일반 기본으로 넣는거다.



// 오후에 기록

//여기도 마찬가지로 right2를 대입해서 추가한다.


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
				
					<!-- 이제 여기서 링크를 누르면 반응하게 해야하는데
					첫번째로 경매내역을 누를때 right 영역에 나올수있도록
					"/gd/test2.jsp?right=/views/aaa" 를 입력한다.  -->
					
					<!-- 오후에 그 기록한거
					여기선 생각보다 간단하게했다. /gd/test2.jsp?right=/views/aaa에 
					/gd/test2.jsp?right=/views/aaa&right2=/views/aaa2 
					즉, &right2=/views/aaa2를 넣으면 추가가 된다.
					여기서 주의할점은 경로를 나타내는 부분이기 때문에 공백이 필요한게 아니라면 절대 공백을 넣어서는 안된다.
					 
					 -->
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