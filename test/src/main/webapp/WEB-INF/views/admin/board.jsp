<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
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
							<th scope="col">idx</th>
							<th scope="col">reg_date</th>
							<th scope="col">id</th>
							<th scope="col">classify</th>
							<th scope="col">title</th>
							
							<th scope="col">first</th>
							<th scope="col">second</th>
							<th scope="col">third</th>
							<th scope="col">image</th>
							<th scope="col">grade</th>
							
							<th scope="col">price</th>
							<th scope="col">now_bid</th>
							<th scope="col">win_bid</th>
							<th scope="col">final_bid</th>
							<th scope="col">hits</th>
							
							<th scope="col">start_date</th>
							<th scope="col">end_date</th>
							
							<th scope="col">view details</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pro_list}" var="pro_list">
							<tr>
								<td>${pro_list.idx}</td>
								<td>${pro_list.reg_date}</td>
								<td>${pro_list.id}</td>
								<td>${pro_list.classify}</td>
								<td>${pro_list.title}</td>
								
								<td>${pro_list.first}</td>
								<td>${pro_list.second}</td>
								<td>${pro_list.third}</td>
								<td>${pro_list.image}</td>
								<td>${pro_list.grade}</td>
								
								<td>${pro_list.price}</td>
								<td>${pro_list.now_bid}</td>
								<td>${pro_list.win_bid}</td>
								<td>${pro_list.final_bid}</td>
								<td>${pro_list.hits}</td>
								
								<td>${pro_list.start_date}</td>
								<td>${pro_list.end_date}</td>
								<td><a href="#">more info</a></td>
						
						</tr>
						</c:forEach>

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