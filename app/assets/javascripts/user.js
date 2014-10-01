// function validateEmail (){ 
// 	judge.validate(document.getElementById('user_email'), {
// 	valid: function(element, messages){
// 		element.style.border = '1px solid green';
// 		alert(messages.join(','))
// 	},
// 	invalid: function(element, messages) {
// 		element.style.border = '1px solid red';
// 		alert(messages.join(','))
// 	}
// });
$('document').ready(function (){
	$('form.new_user').submit(function(){ alert ('hello!') });
})