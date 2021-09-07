<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpvo8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body>
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<div id="root">

		<div id="container">
			<div class="container">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">mno</th>
							<th scope="col">id</th>
							<th scope="col">name</th>
							<th scope="col">phone</th>
							<th scope="col">email</th>
							<th scope="col">view details</th>
							<th scope="col">delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mem_list}" var="mem_list">
							<tr>
								<td>${mem_list.mno}</td>
								<td>${mem_list.id}</td>
								<td>${mem_list.name}</td>
								<td>${mem_list.phone}</td>
								<td>${mem_list.email}</td>
								<td><input type="button" value="info"></td>
								<td><input type="button" value="delete"></td>
						</c:forEach>
						</tr>

					</tbody>
				</table>
			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>