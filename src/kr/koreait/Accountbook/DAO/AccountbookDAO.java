package kr.koreait.Accountbook.DAO;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Accountbook.VO.AccountbookVO;
//create an object of SingleObject
public class AccountbookDAO {
	//create an object of SingleObject
	private static AccountbookDAO instance = new AccountbookDAO();
	//make the constructor private so that this class cannot be
	//instantiated
	private AccountbookDAO() {
	}
	//Get the only object available
	public static AccountbookDAO getInstance() {
		return instance;
	}
	public void write(SqlSession mapper, AccountbookVO vo) {
		mapper.insert("write", vo);
	}

	public ArrayList<AccountbookVO> selectAll(SqlSession mapper) {
		return (ArrayList<AccountbookVO>) mapper.selectList("selectAll");
	}

	public void join(SqlSession mapper, AccountbookVO vo) {
		mapper.insert("join", vo);
	}

	public Boolean id_check(SqlSession mapper, AccountbookVO vo) {
		if ((int) mapper.selectOne("id_count", vo) >= 1) {
			return true;//아이디가 db에 존재하면 true값 리턴
		}
		return false;
	}

	public Boolean idpw_check(SqlSession mapper, AccountbookVO vo) {
		if ((int) mapper.selectOne("idpw_count", vo) >= 1) {
			return true;//한 idx에서 아이디와 패스워드가 db에 존재하면 true값 리턴
		}
		return false;
	}

	public ArrayList<AccountbookVO> select_by_idpw(SqlSession mapper,AccountbookVO vo) {
		return (ArrayList<AccountbookVO>) mapper.selectList("select_by_idpw",vo);
	}

	public ArrayList<AccountbookVO> sum_of_income(SqlSession mapper, AccountbookVO vo) {
		return (ArrayList<AccountbookVO>) mapper.selectList("sum_of_income",vo);
	}
	
	public ArrayList<AccountbookVO> sum_of_expense(SqlSession mapper, AccountbookVO vo) {
		return (ArrayList<AccountbookVO>) mapper.selectList("sum_of_expense",vo);
	}

	public ArrayList<AccountbookVO> sumOfIncomeCash(SqlSession mapper, AccountbookVO vo) {
		return (ArrayList<AccountbookVO>) mapper.selectList("sumOfIncomeCash",vo);
	}

	public ArrayList<AccountbookVO> sumOfExpenseCash(SqlSession mapper, AccountbookVO vo) {
		return (ArrayList<AccountbookVO>) mapper.selectList("sumOfExpenseCash",vo);
	}

	public void delete(SqlSession mapper, int idx) {
		mapper.delete("delete", idx);
	}

	public void update(SqlSession mapper, AccountbookVO vo) {
		mapper.update("update", vo);
	}
	
//	SelectService.java에서 mapper를 넘겨받고 메인글 테이블에 저장된 전체 글의 개수를 얻어오는 xml 파일의
//	select SQL 명령을 실행하는 메소드
	public int selectCount(SqlSession mapper) {
		return (int) mapper.selectOne("selectCount");
	}
	
//	SelectService.java에서 mapper와 startNo, endNo가 저장된 HashMap 객체를 넘겨받고 메인글 테이블에서 한 페이지
//	에 표시할 글을 얻어오는 xml 파일의 select SQL 명령을 실행하는 메소드
	public ArrayList<AccountbookVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		return (ArrayList<AccountbookVO>) mapper.selectList("selectList", hmap);
	}
	
}
