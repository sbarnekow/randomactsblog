function validateEmail () { 
	judge.validate(document.getElementById('user_email'), {
		valid: function(element, messages){
			element.style.border = '1px solid green';
			console.log(messages.join(','))
		},
		invalid: function(element, messages) {
			element.style.border = '1px solid red';
			console.log(messages.join(','))
		}
	});
};

$(document).ready(function (){
	// console.log('hi')
	$('form.new_user').submit( validateEmail() )
});