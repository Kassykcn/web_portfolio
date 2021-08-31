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
<%@ include file="../Top.jsp" %>
<div id="left"></div>
<div id="content">
<input type="hidden" id="search_key" value="${search_key}">
<input type="hidden" id="search_txt" value="${search_txt}">
<table class="table1">
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
		<div>
			<select onchange="filter()" id="classify">
				<option value="0" <c:if test="${filter_codeC == '0' }">selected</c:if> >
					거래종류</option>
				<option value="c0" <c:if test="${filter_codeC == 'c0' }">selected</c:if> >
					전체</option>
				<option value="c1" <c:if test="${filter_codeC == 'c1' }">selected</c:if> >
					경매</option>
				<option value="c2" <c:if test="${filter_codeC == 'c2' }">selected</c:if> >
					구매</option>
			</select>
		</div>
		<div>
			<select onchange="filter()" id="deal_state">
				<option value="0" <c:if test="${filter_codeD == '0' }">selected</c:if> >
				거래상태</option>
				<option value="d0" <c:if test="${filter_codeD == 'd0' }">selected</c:if> >
				전체</option>
				<option value="d1" <c:if test="${filter_codeD == 'd1' }">selected</c:if> >
				진행중</option>
				<option value="d2" <c:if test="${filter_codeD == 'd2' }">selected</c:if> >
				기간만료</option>
				<option value="d3" <c:if test="${filter_codeD == 'd3' }">selected</c:if> >
				거래완료</option>
			</select>
		</div>
		<div><a onclick="sort_num1()">시작일 낮은순</a></div>
		<div><a onclick="sort_num2()">시작일 높은순</a></div>
		<div><a onclick="sort_num3()">조회수 높은순</a></div>
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
						<c:if test="${fn:length(list.getTitle()) < 15}">
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
	
	<%@ include file="register_listBottom.jsp" %>

</div>
<%@ include file="../Bottom.jsp" %>

</body>
</html>