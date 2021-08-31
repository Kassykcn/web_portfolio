/*** 

작성일 : 2021.08.29
***/

$(function (){
	$("#write_link").click(function(){
		location.href="register_write.do";
	});
});

function list(){
	location.href="register_list.do?cur_page=1";
}

function view(){
	var idx = $("#idx").val();
	var cur_page = $("#cur_page").val();
	location.href="register_view.do?idx="+idx+"&cur_page="+cur_page;
}

function sort_num1(){
	location.href= "register_listSort.do?cur_page=1&sort_num=1&filter_codeC=0&filter_codeD=";
}
function sort_num2(){
	location.href= "register_listSort.do?cur_page=1&sort_num=2&filter_codeC=0&filter_codeD=";
}
function sort_num3(){
	location.href= "register_listSort.do?cur_page=1&sort_num=3&filter_codeC=0&filter_codeD=";
}


function filterC(){
	var classify_value = $("#classify").val();
	var state_value = $("#deal_state").val();
	alert(classify_value+"/"+state_value);
	location.href='register_listSort.do?cur_page=1&sort_num=0&filter_codeC='+classify_value+"&filter_codeD="+state_value;
}
function filterD(){
	var classify_value = $("#classify").val();
	var state_value = $("#deal_state").val();
	alert(classify_value+"/"+state_value);
	location.href='register_listSort.do?cur_page=1&sort_num=0&filter_codeC='+classify_value+"&filter_codeD="+state_value;
}
