<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
    <%  
    String mem_id = "mem_id";
//
String log = "";
String mem = "";
if(mem_id == null) {
	log = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "�α���������" + ">�α���</a>";
	mem = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "ȸ������������" + ">ȸ������</a>";
%>

<div align ="right" style="padding-right:70px">
	<tr>
		<td><%=log %></td>
		<td><%=mem %></td>
		<td><a style="text-decoration: none; color:black; font-size:13px;" href="������">������</a></td>
	</tr>
</div>
<%
}else {
	log = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "�α���������" + ">�α׾ƿ�</a>";
	mem = "<a style=\"text-decoration: none; color:black; font-size:13px;\" href=" + "����������" + ">����������</a>";
%>
<div align = "right" style="padding-right:70px">
	<tr>
		<td><%=log %></td>
		<td><%=mem %></td>
		<td><a style="text-decoration: none; color:black; font-size:13px;" href="������">������</a></td>
	</tr>
</div>

<%
}
%>    
<br><br>
<div align="center">
	<a href=Ȩ������ �ּ� ���� ��>
		<!-- Ȩ������ ��ǥ �̹��� ���� �� -->
		<img src="">
	</a>
</div>

<br>

<!-- �˻�â -->
<div align="center"; style="background-color: white; padding-bottom: 20px; padding-top: 20px;">
	<form action="������ ���� ��� ����Ǵ� ����Ʈ" method="post">
		<!-- ī�װ� �̹��� -->
		<img style="margin-top: 10px; margin-left: 7%; padding-left:20px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAgCAYAAABgrToAAAAAAXNSR0IArs4c6QAAAExJREFUWAnt1sEJACAMA0DrJt1/SAVXyKfI9V8Il0+qu88afHtwthdNwOkNyUeAAAECvwuUNRNWbM2EgN4JECBAgEAoYM2EgMuaSQUv1d0EPE4sEMMAAAAASUVORK5CYII=" align="left" width="25" height="25">
		<div style=" display: inline-block; border: 1px solid black; width: object-fit; padding: 10px; border-width:2px; border-style:double; border-color:#4aa8d8; border-radius: 20px">	
			<input type="text" name="Search" style="width:400px;height:20px;font-size:15px; border: none;"/>
			<input type="image" name="submit" value="submit" src="//pics.gmarket.co.kr/pc/single/kr/common/image__header-search.png"
			 align="center" width="27px" height="27px" title="�˻�" alt="�˻���ư" class="search_box_btn"/>
		 </div>	
		 <!-- ��ŵ�������� ��ũ ���� ��� �������� �ٲٰ� ������ ���ִ°� �����Ű���-->
		 <a style="float: right; margin-top: 15px; margin-right: 10px; font-size:25px; padding-right:50px; text-decoration: none; color:black;" href ="��ŵ��������"><strong>��ŵ��</strong></a>
	</form>
</div>

<Br>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>