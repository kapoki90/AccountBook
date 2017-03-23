package kr.koreait.Accountbook.Service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Accountbook.DAO.AccountbookDAO;
import kr.koreait.Accountbook.Mybatis.MySession;
import kr.koreait.Accountbook.VO.AccountbookVO;

public class Ab_JoinService {
	private static Ab_JoinService instance = new Ab_JoinService();
	private Ab_JoinService() { }
	public static Ab_JoinService getInstance() { return instance; }
	
	public void join(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		AccountbookDAO.getInstance().join(mapper,vo);
		mapper.commit();
		mapper.close();	
	}
	
	public Boolean id_check(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		Boolean bool = AccountbookDAO.getInstance().id_check(mapper,vo);
		mapper.close();
		return bool;
	}
}
