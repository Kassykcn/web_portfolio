/*** 

작성일 : 2021.08.29
***/

$(document).ready(function (){
	$("#write_link").click(function(){
		location.href="register_write.do";
	});
	
	var search_key = $("#search_key").val();
	var search_txt = $("#search_txt").val();
	
});

function list(){
	location.href = "register_list.do?cur_page=1";
}

function sort_num1(){
	location.href= "register_list.do?cur_page=1&sort_num=1";
}
function sort_num2(){
	location.href= "register_list.do?cur_page=1&sort_num=2";
}
function sort_num3(){
	location.href= "register_list.do?cur_page=1&sort_num=3";
}


function filter(){
	var classify_value = $("#classify").val();
	var state_value = $("#deal_state").val();
	location.href='register_list.do?cur_page=1&sort_num=0&filter_codeC='+classify_value+"&filter_codeD="+state_value;
}
