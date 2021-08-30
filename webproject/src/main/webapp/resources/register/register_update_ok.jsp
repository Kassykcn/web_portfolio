<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>WriteForm</title>
<c:if test="${result == 1}">
	<script type="text/javascript">
		alert("수정되었습니다.");
		location.href="register_view.do?idx=${idx}&cur_page=${cur_page}";
	</script>
</c:if>
<c:if test="${result != 1}">
	<script type="text/javascript">
		alert("수정에 실패했습니다. 다시 입력해주세요");
		history.back();
	</script>
</c:if>