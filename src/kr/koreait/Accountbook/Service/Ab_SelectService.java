package kr.koreait.Accountbook.Service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Accountbook.DAO.AccountbookDAO;
import kr.koreait.Accountbook.Mybatis.MySession;
import kr.koreait.Accountbook.VO.AccountbookList;
import kr.koreait.Accountbook.VO.AccountbookVO;

public class Ab_SelectService {
	private static Ab_SelectService instance = new Ab_SelectService();
	private Ab_SelectService() { }
	public static Ab_SelectService getInstance() { return instance; }
	
	public ArrayList<AccountbookVO> selectAll(){
		SqlSession mapper = MySession.getSession();
		ArrayList<AccountbookVO> all_list = AccountbookDAO.getInstance().selectAll(mapper);
		mapper.close();
		return all_list;
	}
	
	public AccountbookList select_by_idpw(AccountbookVO vo,int currentPage){
		SqlSession mapper = MySession.getSession();
		AccountbookDAO dao = AccountbookDAO.getInstance();
		int pageSize = 7;
		int totalCount = dao.selectCount(mapper);
		
		AccountbookList list = new AccountbookList(pageSize, totalCount, currentPage);
		
		vo.setStartNo(list.getStartNo());
		vo.setEndNo(list.getEndNo());
		
		ArrayList<AccountbookVO> selected_by_idpw = AccountbookDAO.getInstance().select_by_idpw(mapper,vo);
		
		list.setList(selected_by_idpw);
		
		mapper.close();
		return list;
	}	
	
	public ArrayList<AccountbookVO> sum_of_income(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		ArrayList<AccountbookVO> sum_of_income_list = AccountbookDAO.getInstance().sum_of_income(mapper,vo);
		mapper.close();
		return sum_of_income_list;
	}	
	public ArrayList<AccountbookVO> sum_of_expense(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		ArrayList<AccountbookVO> sum_of_expense_list = AccountbookDAO.getInstance().sum_of_expense(mapper,vo);
		mapper.close();
		return sum_of_expense_list;
	}
	
	public ArrayList<AccountbookVO> sumOfIncomeCash(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		ArrayList<AccountbookVO> sumOfIncomeCashList = AccountbookDAO.getInstance().sumOfIncomeCash(mapper,vo);
		mapper.close();
		return sumOfIncomeCashList;
	}
	
	public ArrayList<AccountbookVO> sumOfExpenseCash(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		ArrayList<AccountbookVO> sumOfExpenseCashList = AccountbookDAO.getInstance().sumOfExpenseCash(mapper,vo);
		mapper.close();
		return sumOfExpenseCashList;
	}
}
