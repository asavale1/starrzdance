$(document).ready(function() { 
	$('#home').hide();
});

function onSubmit(){
	$('#confirm').hide();
	$('#home').show();
	return true;
}