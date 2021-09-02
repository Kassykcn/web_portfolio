<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<c:set var="cur_page" value="${cur_page}" />
<c:set var="totalCnt" value="${totalCnt}" />
<c:set var="paging" value="${paging}" />
<c:set var="sort_num" value="${sort_num}" />
<c:set var="filter_codeC" value="${filter_codeC}" />
<c:set var="filter_codeD" value="${filter_codeD}" />

<c:if test="${regList != '[]'}">
	<table class="bottom_table">
		<tr>
			<td><c:if test="${cur_page != 1}">
					[<a
						href="register_list.do?cur_page=1&sort_num=${sort_num}&filter_codeC=${filter_codeC}&filter_codeD=${filter_codeD}">
						처음 </a>]
				</c:if> <c:forEach var="i" begin="1" end="${paging}">

					<a
						href="register_list.do?cur_page=${i}&sort_num=${sort_num}&filter_codeC=${filter_codeC}&filter_codeD=${filter_codeD}">
						[<c:if test="${i == cur_page}">
							<b>
						</c:if> ${i} <c:if test="${i == cur_page}">
							</b>
						</c:if>]
					</a>
				</c:forEach> <c:if test="${cur_page != paging}">
					[<a
						href="register_list.do?cur_page=${paging}&sort_num=${sort_num}&filter_codeC=${filter_codeC}&filter_codeD=${filter_codeD}">
						마지막 </a>]
				</c:if></td>
		</tr>
	</table>
</c:if>
<sf:form modelAttribute="searchVO" method="post"
	action="register_list.do">
	<input type="hidden" name="cur_page" value="${cur_page}">
	<div class="bottom_table">
		<select name="search_key">
			<option value="title"
				<c:if test="${search_key == 'title'}">selected</c:if>>제목</option>
			<option value="details"
				<c:if test="${search_key == 'details'}">selected</c:if>>내용</option>
			<option value="id" <c:if test="${search_key == 'id'}">selected</c:if>>
				작성자</option>
		</select>
		<sf:input path="search_txt" id="search_txt" value="${search_txt}"
			placeholder="검색어를 입력하세요" />
		<input type="submit" class="btn1" value="검색">
	</div>
</sf:form>