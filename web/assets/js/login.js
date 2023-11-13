$(function(){
	$("#submitBtn").click(function(){
		var userCode=document.getElementById("userCode");
		var userPassWord=document.getElementById("userPassWord");
		if(userCode.validity.valueMissing){
			userCode.setCustomValidity("The account cannot be empty");
		}else if(userCode.validity.patternMismatch){
			userCode.setCustomValidity("Please enter 6 to 16 digits or letters");
		}else{
			userCode.setCustomValidity("");
		}
		if(userPassWord.validity.valueMissing){
			userPassWord.setCustomValidity("The password cannot be empty");
		}else if(userPassWord.validity.patternMismatch){
			userPassWord.setCustomValidity("Please enter 6 to 16 digits or letters");
		}else{
			userPassWord.setCustomValidity("");
		}
	});
	
});