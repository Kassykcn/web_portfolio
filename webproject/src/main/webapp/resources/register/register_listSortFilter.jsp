<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="sort_num" value="${sort_num}"/>
<c:set var="filter_codeC" value="${filter_codeC}"/>
<c:set var="filter_codeD" value="${filter_codeD}"/>    
<div>
	<select onchange="filter()" id="classify">
		<option value="0" <c:if test="${filter_codeC == '0' }">selected</c:if> >
			�ŷ�����</option>
		<option value="c0" <c:if test="${filter_codeC == 'c0' }">selected</c:if> >
			��ü</option>
		<option value="c1" <c:if test="${filter_codeC == 'c1' }">selected</c:if> >
			���</option>
		<option value="c2" <c:if test="${filter_codeC == 'c2' }">selected</c:if> >
			����</option>
	</select>
</div>
<div>
	<select onchange="filter()" id="deal_state">
		<option value="0" <c:if test="${filter_codeD == '0' }">selected</c:if> >
		�ŷ�����</option>
		<option value="d0" <c:if test="${filter_codeD == 'd0' }">selected</c:if> >
		��ü</option>
		<option value="d1" <c:if test="${filter_codeD == 'd1' }">selected</c:if> >
		������</option>
		<option value="d2" <c:if test="${filter_codeD == 'd2' }">selected</c:if> >
		�Ⱓ����</option>
		<option value="d3" <c:if test="${filter_codeD == 'd3' }">selected</c:if> >
		�ŷ��Ϸ�</option>
	</select>
</div>
<div><a onclick="sort_num1()">������ ������</a></div>
<div><a onclick="sort_num2()">������ ������</a></div>
<div><a onclick="sort_num3()">��ȸ�� ������</a></div>