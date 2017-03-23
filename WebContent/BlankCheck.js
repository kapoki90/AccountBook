function BlankCheck(){
	
	f = document.accountbookForm;

/*	if (!f.income_expense.value || f.income_expense.value.trim().length == 0) {
		alert("Please check expense or income.");
		return false;
	}*/
	
	if (!f.amount.value || f.amount.value.trim().length == 0) {
		alert("Please enter the amount");
		return false;
	}
	
/*	if (!f.card_or_cash.value || f.card_or_cash.value.trim().length == 0) {
		alert("Please check card or cash.");
		return false;
	}*/
	return true;
	
}

