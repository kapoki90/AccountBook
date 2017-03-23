function set(mode, idx, title, income_expense, amount, currency,
		kind, memo, card_or_cash) {
	f = document.accountbookForm;
	f.mode.value = mode;
	f.idx.value = idx;
	f.btnTitle.value = title;
	if (income_expense == 'expense') {
		document.getElementById("expenseBtn").checked = true;
	} else {
		document.getElementById("incomeBtn").checked = true;
	}
	f.amount.value = amount;
	f.currency.value = currency;
	f.kind.value = kind;
	f.memo.value = memo;

	if (card_or_cash == 'card') {
		document.getElementById("card").checked = true;
	} else {
		document.getElementById("cash").checked = true;
	}
}