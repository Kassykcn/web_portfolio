<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



	<style>
.menu {
	display: inline-block;
	text-align: center;
	font-size: 20px;
}
</style>
	<div class="container">
 		<div class="row">
   			<div class="col col-lg-3">
   				<div class="menu">
   	  				<a href="/app">AllGoods Admin</a>
   	  			</div>
   		 	</div>
   	 		<div class="col-md-auto">
   	 			<div class="menu">
     				<a href="${path}member"> 회원관리 </a> 
     	 			<a href="${path}board"> 게시글 관리 </a>
      				<a href="${path}report"> 신고/문의관리 </a>
      			</div>
    		</div>
    		<div class="col col-lg-3">
    			<div class="menu">
    				<a href="#">본 사이트로 이동</a>
    				<a href="#">로그아웃</a>
    			</div>
    		</div>
    	</div>
	</div>
