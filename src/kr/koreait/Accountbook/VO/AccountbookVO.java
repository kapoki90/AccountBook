package kr.koreait.Accountbook.VO;

import java.util.Date;

public class AccountbookVO {
	private int idx;// 입력되는 순서대로 부여되는 일련번호
	private Date wdate;
	private String income_expense;
	private int amount=0;
	private String currency;
	private String kind;
	private String memo="";
	private String card_or_cash;
	private String id;
	private String password;
	private int startNo;					// 현재 화면에 표시될 시작 글의 일련번호
	private int endNo;						// 현재 화면에 표시될 마지막 글의 일련번호
	
	
	
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public String getIncome_expense() {
		return income_expense;
	}
	public void setIncome_expense(String income_expense) {
		this.income_expense = income_expense;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getCard_or_cash() {
		return card_or_cash;
	}
	public void setCard_or_cash(String card_or_cash) {
		this.card_or_cash = card_or_cash;
	}
	@Override
	public String toString() {
		return "AccountbookVO [idx=" + idx + ", wdate=" + wdate + ", income_expense=" + income_expense + ", amount="
				+ amount + ", currency=" + currency + ", kind=" + kind + ", memo=" + memo + ", card_or_cash="
				+ card_or_cash + ", id=" + id + ", password=" + password + "]";
	}

	
	
}
