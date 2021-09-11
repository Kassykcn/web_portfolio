<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %> 
<c:set var="cur_page" value="${cur_page}" />
<c:set var="totalCnt" value="${totalCnt}" />  
<c:set var="paging" value="${paging}" />
<c:set var="sort_num" value="${sort_num}"/>
<c:set var="filter_codeC" value="${filter_codeC}"/>
<c:set var="filter_codeD" value="${filter_codeD}"/>
<c:set var="search_key" value="${search_key}" /> 
<c:set var="search_txt" value="${search_txt}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/register_list.css"/>'>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src='<c:url value="/resources/js/register_list.js"/>' charset="UTF-8"></script>
</head>
<body>
<!-- div의 css태그들은 frame.css 참조, 틀 위치잡기용  -->

<c:import url="/resources/Top.jsp"/>

<div id="left"></div>
<div id="content">
	<table class="page_title">
		<tr>
			<td class="align_left"><h2><a onclick="list()">경매/구매 목록</a></h2></td>
		</tr>
	</table>

	<div class="cntPage">
		<span>총 게시물 수 : <c:out value="${totalCnt}"/> </span>
	</div>
	<div class="write_link">
		<input type="button" id="write_link" class="btn1" value="등록">
	</div>
	<div class="sort">
		<c:import url="/resources/register/register_listSortFilter.jsp"/>
	</div>
	
	<table class="table2">
		<thead class="table2th">
			<tr>
				<th class="table2th1">글번호</th>
				<th class="table2th1">구분</th>
				<th class="table2th3">제목</th>
				<th class="table2th2">기간</th>
				<th class="table2th1">상태</th>
				<th class="table2th1">조회수</th>
			</tr>
		</thead>
		<tbody class="table2td">
		<c:if test="${regList == '[]'}">
			<tr>
				<td colspan="6">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${regList != '[]'}">
			<c:forEach var="list" items="${regList}">
				<input type="hidden" id="idx" value="${list.getIdx()}">
				<input type="hidden" id="cur_page" value="${cur_page}">
				<tr>
					<td><c:out value="${list.getIdx()}"/></td>
					<td><c:out value="${list.getClassify()}"/></td>
					<td><a href="register_view.do?idx=${list.getIdx()}&cur_page=${cur_page}">
						<c:if test="${fn:length(list.getTitle()) > 15}">
							${fn:substring(list.getTitle(),0,15)}...
						</c:if> 
						<c:if test="${fn:length(list.getTitle()) <= 15}">
							<c:out value="${list.getTitle()}"/>
						</c:if> 
					</a></td>
					<td><c:out value="${list.getStart_date()}"/>~<c:out value="${list.getEnd_date()}"/></td>
					<td><c:out value="${list.getDeal_state()}"/></td>
					<td><c:out value="${list.getHits()}"/></td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	
	<c:import url="/resources/register/register_listBottom.jsp"/>

</div>

<c:import url="/resources/Bottom.jsp"/>

</body>
</html>