<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>WRITE</title>
<c:if test="${result == 1}">
	<script type="text/javascript">
		alert("등록되었습니다.");
		location.href="register_list.do?cur_page=1";
	</script>
</c:if>
<c:if test="${result != 1}">
	<script type="text/javascript">
		alert("등록에 실패했습니다. 다시 입력해주세요");
		location.href="register_write.do";
	</script>
</c:if>