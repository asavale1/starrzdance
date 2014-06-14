var valid_name = false;
var valid_age = false;
var valid_email = false;
var valid_sched = false;

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
	verifyName(document.getElementById("student_name"));
	verifyAge(document.getElementById("age"));
	verifyEmail(document.getElementById('email'));
});

function verifyName(elem){
	if(elem.value.trim()){
		valid_name = true;
		colorSet("name-group", SUCCESS);
		$('#name-help').css("display","none");
	}else{
		valid_name = false;
		colorSet("name-group", ERROR);
		$('#name-help').css("display","block");
	}

	validate();
}

function verifyAge(elem){
	if(elem.value.trim()){
		var match = elem.value.match(/^(\d+)$/);
		if(match != null){
			valid_age = true;
			colorSet("age-group", SUCCESS);
			$('#age-help').css("display","none");
		}else{
			valid_age = false;
			colorSet("age-group", ERROR);
			$('#age-help').css("display","block");
			$('#age-help').text("Invalid format");
		}
	}else{
		colorSet("age-group", ERROR);
		$('#age-help').css("display","block");
		$('#age-help').text("Age required");
		valid_age = false;
	}
	validate();
}

function verifyEmail(elem){
	if(elem.value.trim()){
		var match = elem.value.match(/^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}$/);
		if(match != null){
			valid_email = true;
			colorSet("email-group", SUCCESS);
			$('#email-help').css("display","none");
		}else{
			valid_email = false;
			colorSet("email-group", ERROR);
			$('#email-help').css("display","block");
			$('#email-help').text("Invalid format");
		}
	}else{
		valid_email = false;
		colorSet("email-group", ERROR);
		$('#email-help').css("display","block");
		$('#email-help').text("Email required");
	}
	validate();
	
}

function checkSchedule(elem){
	if(elem.value.trim()){
		valid_sched = true;
		$('#sched-help').css("display","none");
	}else{
		valid_sched = false;
		$('#sched-help').css("display","block");
	}
	
	validate();
}

function validate(){
	var valid = valid_name && valid_email && valid_age && valid_sched;
	console.log(valid_name + "\t" + valid_email + "\t" + valid_age + "\t" + valid_sched);
	if(valid){
		$('.register').removeAttr("disabled");
	}else{
		$('.register').attr("disabled", "disabled");
	}
}