<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- mem_id로 로그인 여부 체크 로그인이안되어있을경우 null값으로 상단 3개의 버튼이 로그인 회원가입 고객센터로 유지
   null값이 아닐 경우 로그아웃 마이페이지 고객센터 페이지 이동으로 연결 
   mem_id;
   -->

<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/top.css"/>'>


<% 
String id = null;
//
String log = "";
String mem = "";
if(id == null) {
   log = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "로그인페이지" + ">로그인</a>";
   mem = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "회원가입페이지" + ">회원가입</a>";
%>
<div class="ontop">
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
<div class="ontop">
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
      <img alt="배너" src='<c:url value="/resources/logo.png"/>'>
   </a>
</div>

<br>

<!-- 검색창 -->
<div class="middletop">
   <form action="돋보기 누를 경우 연결되는 사이트" method="post">
      <!-- 카테고리 이미지 -->
      <img class="menu" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAgCAYAAABgrToAAAAAAXNSR0IArs4c6QAAAExJREFUWAnt1sEJACAMA0DrJt1/SAVXyKfI9V8Il0+qu88afHtwthdNwOkNyUeAAAECvwuUNRNWbM2EgN4JECBAgEAoYM2EgMuaSQUv1d0EPE4sEMMAAAAASUVORK5CYII=">
      <!-- hover시 보이는 곳 -->
      <div class="menu_item">
      
      </div>
      
      <!-- 검색묶음 -->
      <div class="searchbar">   
         <input class="searchbox" type="text" name="Search"/>
         <input class="searchbtn" type="image" name="submit" value="submit" src="//pics.gmarket.co.kr/pc/single/kr/common/image__header-search.png" title="검색" alt="검색버튼"/>
       </div>   
       <!-- 경매등록페이지 링크 연동 얘는 사진으로 바꾸고 연동만 해주는게 좋을거같음-->
       <a class="buying" href ="경매등록페이지"><strong>경매등록</strong></a>
   </form>
</div>

<Br>