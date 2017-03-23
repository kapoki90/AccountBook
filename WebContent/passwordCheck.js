function passwordCheck() {
	f = document.join_form;

	if (!f.id.value || f.id.value.trim().length == 0) {
		alert("Please enter id");
		f.id.value = "";
		f.id.focus();
		return false;
	}

	if (!f.password.value || f.password.value.trim().length == 0
			|| !f.password2.value || f.password2.value.trim().length == 0) {
		alert("Please enter password");
		f.password.value = "";
		f.password2.value = "";
		f.password.focus();
		return false;
	}

	if (f.password.value != f.password2.value) {
		alert('New password and confirm password must be the same');
		f.password.value = "";
		f.password2.value = "";
		f.password2.focus();
		return false;
	}
	return true;
}

function passwordCheckLogin() {
	f = document.Login_form;

	if (!f.id.value || f.id.value.trim().length == 0) {
		alert("Please enter id");
		f.id.value = "";
		f.id.focus();
		return false;
	}

	if (!f.password.value || f.password.value.trim().length == 0) {
		alert("Please enter password");
		f.password.value = "";
		f.password.focus();
		return false;
	}

	return true;
}

function settingWork(work) {
	f = document.join_form;

	if (!f.id.value || f.id.value.trim().length == 0) {
		alert("Please enter id");
		f.id.value = "";
		f.id.focus();
		return false;
	}else{
		f.work.value = work;
		return true;
	}
}
