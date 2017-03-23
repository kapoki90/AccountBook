package kr.koreait.Accountbook.Service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Accountbook.DAO.AccountbookDAO;
import kr.koreait.Accountbook.Mybatis.MySession;
import kr.koreait.Accountbook.VO.AccountbookVO;

public class Ab_UpdateService {
	private static Ab_UpdateService instance = new Ab_UpdateService();
	private Ab_UpdateService() { }
	public static Ab_UpdateService getInstance() { return instance; }
	
//	updateOK.jsp에서 수정할 내용이 저장된 객체를 넘겨받고 mapper를 얻어오는 메소드
	public void update(AccountbookVO vo) {
		SqlSession mapper = MySession.getSession();
		AccountbookDAO.getInstance().update(mapper, vo);
		mapper.commit();
		mapper.close();
	}
}
