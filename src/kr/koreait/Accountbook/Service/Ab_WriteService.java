package kr.koreait.Accountbook.Service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Accountbook.DAO.AccountbookDAO;
import kr.koreait.Accountbook.Mybatis.MySession;
import kr.koreait.Accountbook.VO.AccountbookVO;

public class Ab_WriteService {
	private static Ab_WriteService instance = new Ab_WriteService();
	private Ab_WriteService() { }
	public static Ab_WriteService getInstance() { return instance; }
	
	public void write(AccountbookVO vo){
		SqlSession mapper = MySession.getSession();
		AccountbookDAO.getInstance().write(mapper,vo);
		mapper.commit();
		mapper.close();
	}
}
