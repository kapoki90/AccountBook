package kr.koreait.Accountbook.Service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Accountbook.DAO.AccountbookDAO;
import kr.koreait.Accountbook.Mybatis.MySession;
import kr.koreait.Accountbook.VO.AccountbookVO;

public class Ab_DeleteService {
	private static Ab_DeleteService instance = new Ab_DeleteService();
	private Ab_DeleteService() { }
	public static Ab_DeleteService getInstance() { return instance; }
	
	public void delete(int idx){
		SqlSession mapper = MySession.getSession();
		AccountbookDAO.getInstance().delete(mapper,idx);
		mapper.commit();
		mapper.close();	
	}
}
