<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>��� ���� ���</h2>
<table border="2" width="400" height="50">
<tr>
<td>�����</td>  
<td>&nbsp;&nbsp;<select name="language" style="width:90px;height:25px;" > 
    <option value="none">=== ���� ===</option>
    <option value="�泲">�泲����</option>
    <option value="����" selected>��������</option>
    <option value="���">�������</option>
   <option value="�뱸">�뱸����</option>
<option value="����">��������</option>
<option value="�λ�">�λ�����</option>
<option value="������">�������ݰ�</option>
<option value="����">��������</option>
<option value="��Ƽ">��Ƽ����</option>
<option value="����">����</option>
<option value="��ü��">��ü��</option>
<option value="��������">��������</option>
<option value="���̹�ũ">���̹�ũ</option>
<option value="īī��">īī����ũ</option>
<option value="�ϳ�">�ϳ�����</option>
  </select></td>
</tr>
<tr>
<td>���¹�ȣ</td>
<td>&nbsp;&nbsp;<input type="text" style="width:200px;height:25px;"></td>
</tr>
<tr>
<td>�����ָ�</td>
<td>&nbsp;&nbsp;<input type="text" style="width:90px;height:25px;"></td>
</tr>

</table>
<br>
<button type="button" class="btn-light" style="text-align:center; width:100px; height:30px;">���</button> 
			 <button type="button" class="btn-light" style="text-align:center; width:100px; height:30px;" onclick="window.location.href='Withdraw.jsp'">��û�ϱ�</button>
</body>
</html>