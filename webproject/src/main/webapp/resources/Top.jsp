<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- mem_id로 로그인 여부 체크 로그인이안되어있을경우 null값으로 상단 3개의 버튼이 로그인 회원가입 고객센터로 유지
	null값이 아닐 경우 로그아웃 마이페이지 고객센터 페이지 이동으로 연결 
	mem_id;
	-->
	
<% 
String id = "";
//
String log = "";
String mem = "";
if(id == null) {
	log = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "로그인페이지" + ">로그인</a>";
	mem = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "회원가입페이지" + ">회원가입</a>";
%>
<div align ="right" style="padding-right:70px">
	<tr>
		<td><%=log %></td>
		<td><%=mem %></td>
		<td><a style="text-decoration: none; color:black; font-size:13px;" href="CS.jsp">고객센터</a></td>
	</tr>
</div>
<%
}else {
	log = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "로그인페이지" + ">로그아웃</a>";
	mem = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "마이페이지" + ">마이페이지</a>";
%>
<div align = "right" style="padding-right:70px">
	<tr>
		<td><%=log %></td>
		<td><%=mem %></td>
		<td><a style="text-decoration: none; color:black; font-size:13px;" href="CS.jsp">고객센터</a></td>
	</tr>
</div>

<%
}
%>    
<br><br>
<div align="center">
	<a href=홈페이지 주소 넣을 곳>
		<!-- 홈페이지 대표 이미지 넣을 곳 -->
		<img src="">
	</a>
</div>

<br>

<!-- 검색창 -->
<div align="center"; style="background-color: white; padding-bottom: 20px; padding-top: 20px;">
	<form action="돋보기 누를 경우 연결되는 사이트" method="post">
		<!-- 카테고리 이미지 -->
		<img style="margin-top: 10px; margin-left: 7%; padding-left:20px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAgCAYAAABgrToAAAAAAXNSR0IArs4c6QAAAExJREFUWAnt1sEJACAMA0DrJt1/SAVXyKfI9V8Il0+qu88afHtwthdNwOkNyUeAAAECvwuUNRNWbM2EgN4JECBAgEAoYM2EgMuaSQUv1d0EPE4sEMMAAAAASUVORK5CYII=" align="left" width="25" height="25">
		<div style=" display: inline-block; border: 1px solid black; width: object-fit; padding: 10px; border-width:2px; border-style:double; border-color:#4aa8d8; border-radius: 20px">	
			<input type="text" name="Search" style="width:400px;height:20px;font-size:15px; border: none;"/>
			<input type="image" name="submit" value="submit" src="//pics.gmarket.co.kr/pc/single/kr/common/image__header-search.png"
			 align="center" width="27px" height="27px" title="검색" alt="검색버튼" class="search_box_btn"/>
		 </div>	
		 <!-- 경매등록페이지 링크 연동 얘는 사진으로 바꾸고 연동만 해주는게 좋을거같음-->
		 <a style="float: right; margin-top: 15px; margin-right: 10px; font-size:25px; padding-right:50px; text-decoration: none; color:black;" href ="경매등록페이지"><strong>경매등록</strong></a>
	</form>
</div>

<Br>