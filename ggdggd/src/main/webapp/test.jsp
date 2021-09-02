<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

.outer {width: 900px; height: 1000px; background-color :gray;}
.first {width: 900px; height: 200px; background-color : blue;}
.second {width: 900px; height: 25px; background-color :fuchsia;}
.third {width: 900px; height: 575px; background-color : green;}
.third :after {clear:both;  display: block;}
.third .left { float:left; width: 250px; height: 575px; background-color : orange;}
.third .right { float:right; width: 650px; height: 575px; background-color : olive;}

.forth {width: 900px; height: 200px; background-color : lime;}

</style>

</head>
<body>

<div class ="outer">
<div class ="first">a</div>





<div class ="second">s</div>
<div class ="third">




<div class ="right">d</div>








<div class ="left"></div>


</div>



<div class ="forth"></div>




</div>




</body>
</html>