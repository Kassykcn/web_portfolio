<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %> 
<c:set var="cur_page" value="${cur_page}" />
<c:set var="totalCnt" value="${totalCnt}" />  
<c:set var="paging" value="${paging}" />
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
<table class="table1">
	<tr>
		<td class="align_left"><h2><a href="register_list.do?cur_page=1">경매/구매 목록</a></h2></td>
	</tr>
</table>

	<div class="cntPage">
		<span>총 게시물 수 : <c:out value="${totalCnt}"/> </span>
	</div>
	<div class="write_link">
		<input type="button" id="write_link" class="btn1" value="등록">
	</div>
	<div class="sort">
		<form id="sort_form">
			<div>
				<select>
					<option value="0">거래종류</option>
					<option value="전체">전체</option>
					<option value="경매">경매</option>
					<option value="구매">구매</option>
				</select>
			</div>
			<div>
				<select>
					<option value="0">거래상태</option>
					<option value="전체">전체</option>
					<option value="진행중">진행중</option>
					<option value="기간만료">기간만료</option>
					<option value="거래완료">거래완료</option>
				</select>
			</div>
			<div><a href="register_listSort.do?cur_page=1&sort_num=1">시작일 낮은순</a></div>
			<div><a href="register_listSort.do?cur_page=1&sort_num=2">시작일 높은순</a></div>
			<div><a href="register_listSort.do?cur_page=1&sort_num=3">조회수 높은순</a></div>
		</form>
	</div>
	<form id="reg_list">
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
			<c:forEach var="list" items="${regList}">
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
			</tbody>
		</table>
	</form>
	<table class="search_table">
		<tr>
			<td>
				<c:if test="${cur_page != 1}">
					[<a href="register_list.do?cur_page=1">
					처음
					</a>]
				</c:if>
				<c:forEach var="i" begin="1" end="${paging}">
					
					<a href="register_list.do?cur_page=${i}">
					[<c:if test="${i == cur_page}"><b></c:if>
					${i}
					<c:if test="${i == cur_page}"></b></c:if>]
					</a>
				</c:forEach>
				<c:if test="${cur_page != paging}">
					[<a href="register_list.do?cur_page=${paging}">
					마지막
					</a>]
				</c:if>
			</td>
		</tr>
	</table>
	<sf:form modelAttribute="searchVO" method="post" action="register_serchList.do"> 
		<input type="hidden" name="cur_page" value="${cur_page}">
		<div class="search_table">
			<select name="search_key">
				<option value="title" <c:if test="${search_key == 'title'}">selected</c:if>>
					제목</option>
				<option value="details" <c:if test="${search_key == 'details'}">selected</c:if>>
					내용</option>
				<option value="id" <c:if test="${search_key == 'id'}">selected</c:if>>
					작성자</option>
			</select>
			<sf:input path="search_txt" id="search_txt" placeholder="검색어를 입력하세요"/>
			<input type="submit" class="btn1" value="검색">
		</div>
	</sf:form>
</div>
<%@ include file="../Bottom.jsp" %>

</body>
</html>