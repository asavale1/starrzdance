var valid_name = false;
var valid_content = false;

var ERROR = 1;
var SUCCESS = 0;
var CLEAR = 3;

function colorSet(id, status){
	if(status == ERROR){
		$('#' + id).removeClass('success');
		$('#' + id).addClass('error');
	}else if(status == SUCCESS){
		$('#' + id).removeClass('error');
		$('#' + id).addClass('success');
	}else if(status == CLEAR){
		$('#' + id).removeClass('error');
		$('#' + id).removeClass('success');
	}
}

$(document).ready(function(){
	verifyName(document.getElementById("name"));
	verifyContent(document.getElementById("content"));
});

function verifyName(elem){
	if(elem.value.trim()){
		valid_name = true;
		colorSet("name-group", SUCCESS);
	}else{
		valid_sched = false;
		colorSet("name-group", ERROR);
	}
	
	validate();
}

function verifyContent(elem){
	if(elem.value.trim()){
		valid_content = true;
		colorSet("content-group", SUCCESS);
	}else{
		valid_content = false;
		colorSet("content-group", ERROR);
	}

	validate();
}

function validate(){
	var valid = valid_name && valid_content;
	if(valid){
		$('.submit').removeAttr("disabled");
	}else{
		$('.submit').attr("disabled", "disabled");
	}
}