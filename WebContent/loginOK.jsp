<%@page import="kr.koreait.Accountbook.VO.AccountbookList"%>
<%@page import="kr.koreait.Accountbook.Service.Ab_SelectService"%>
<%@page import="kr.koreait.Accountbook.VO.AccountbookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.koreait.Accountbook.Service.Ab_LoginService"%>
<%@page import="kr.koreait.Accountbook.Service.Ab_JoinService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인된 정보를 db에 있는지 확인하고 로그인성공하면 아이디/패스워드 write.jsp로 전송,
 db에서 가계부를 꺼내오고 실패하면 다시 로그인페이지로 돌아간다 -->

	<%
		//request영역응로 넘어오는 데이터의 인코딩을 유니코드로 설정
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
	%>
	<!-- 로그인페이지에서 id,password를 AccountbookVO형 객체로 만들어준다 -->
	<jsp:useBean id="vo" class="kr.koreait.Accountbook.VO.AccountbookVO">
		<jsp:setProperty property="*" name="vo" />
	</jsp:useBean>
	<%
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
		}

		//저장,삭제,수정페이지에서 넘어올때 usebean객체 생성이 안되므로 request영역으로 넘어온값으로 설정해준다.
		if (vo.getId().equals(null)&&vo.getPassword().equals(null)) {
			vo.setId(id);
			vo.setPassword(password);
		}
		
		//id/pw 가 db에 있는지 확인
		if (Ab_LoginService.getInstance().idpw_check(vo)){
			out.println("<script>");
			out.println("alert('Login successful')");
			out.println("</script>");
			//id,password로 db에서 가계부목록을 arraylist로 가져온다.
			AccountbookList Ab_list = Ab_SelectService.getInstance().select_by_idpw(vo,currentPage);
			
			//수입합계계산
			ArrayList<AccountbookVO> sum_of_income = Ab_SelectService.getInstance().sum_of_income(vo);
			int income_sum = 0;
			for (AccountbookVO array : sum_of_income) {
				income_sum += array.getAmount();
			}

			//지출합계계산
			ArrayList<AccountbookVO> sum_of_expense = Ab_SelectService.getInstance().sum_of_expense(vo);
			int expense_sum = 0;
			for (AccountbookVO array : sum_of_expense) {
				expense_sum += array.getAmount();
			}

			//현금잔액 계산 현금잔액 = (현금)수입총합 - (현금)지출총합
			ArrayList<AccountbookVO> sumOfIncomeCashList = Ab_SelectService.getInstance().sumOfIncomeCash(vo);
			int sumOfIncomeCash = 0;
			for (AccountbookVO array : sumOfIncomeCashList) {
				sumOfIncomeCash += array.getAmount();
			}

			ArrayList<AccountbookVO> sumOfExpenseCashList = Ab_SelectService.getInstance().sumOfExpenseCash(vo);
			int sumOfExpenseCash = 0;
			for (AccountbookVO array : sumOfExpenseCashList) {
				sumOfExpenseCash += array.getAmount();
			}
			int sumOfCash = sumOfIncomeCash - sumOfExpenseCash;

			/* 			System.out.println("sumOfIncomeCash :" + sumOfIncomeCash + "sumOfCash :" + sumOfCash
								+ "sumOfExpenseCash :" + sumOfExpenseCash); */
			request.setAttribute("sum_of_income", income_sum);
			request.setAttribute("sum_of_expense", expense_sum);
			request.setAttribute("sumOfCash", sumOfCash);
			request.setAttribute("selected_list", Ab_list);
			request.setAttribute("idpw", vo);
			pageContext.forward("write.jsp");

		} else {
			out.println("<script>");
			out.println("alert('Login fail: Id does not exist on server or Password is inaccurate')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		}
	%>
</body>
</html>