package kr.koreait.Accountbook.Service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Accountbook.DAO.AccountbookDAO;
import kr.koreait.Accountbook.Mybatis.MySession;
import kr.koreait.Accountbook.VO.AccountbookVO;

public class Ab_LoginService {
	private static Ab_LoginService instance = new Ab_LoginService();
	private Ab_LoginService() { }
	public static Ab_LoginService getInstance() { return instance; }
	
	public Boolean idpw_check(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		Boolean bool = AccountbookDAO.getInstance().idpw_check(mapper,vo);
		mapper.close();
		return bool;
	}
}
