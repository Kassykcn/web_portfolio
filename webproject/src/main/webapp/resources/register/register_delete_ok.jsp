<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>DELETE</title>
<c:if test="${result == 1}">
	<script type="text/javascript">
		alert("�����Ǿ����ϴ�.");
		location.href="register_list.do?cur_page=${cur_page}&totalCnt=${totalCnt}";
	</script>
</c:if>
<c:if test="${result != 1}">
	<script type="text/javascript">
		alert("������ �����߽��ϴ�. �ٽ� �Է����ּ���");
		history.back();
	</script>
</c:if>