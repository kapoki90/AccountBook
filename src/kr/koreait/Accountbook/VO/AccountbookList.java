package kr.koreait.Accountbook.VO;

import java.util.ArrayList;

public class AccountbookList {
	private ArrayList<AccountbookVO> list;
	private int pageSize;					// 페이지당 글의 개수
	private int totalCount;					// 전체 글의 개수
	private int totalPage;					// 전체 페이지의 개수
	private int currentPage;				// 현재 화면에 표시할 페이지
	private int startNo;					// 현재 화면에 표시될 시작 글의 일련번호
	private int endNo;						// 현재 화면에 표시될 마지막 글의 일련번호
	private int startPage;					// 현재 화면에 표시될 페이지 이동 하이퍼링크 시작 페이지 번호
	private int endPage;					// 현재 화면에 표시될 페이지 이동 하이퍼링크 끝 페이지 번호
	
	
//	pageSize, totalCount, currentPage를 넘겨받고 나머지 5개의 변수를 계산해 초기화 시키는 생성자
	public AccountbookList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();						// 나머지 변수를 계산하는 메소드를 호출한다.
	}

	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;			// MySQL은 1을 더하지 않는다.
		endNo = startNo + pageSize - 1;						// MySQL은 이 변수를 사용하지 않는다.
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}
	
	public ArrayList<AccountbookVO> getList() {
		return list;
	}

	public void setList(ArrayList<AccountbookVO> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

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

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "AccountbookList [list=" + list + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}


	
	
}
