<%@page import="java.util.Date"%>
<%@page import="kr.koreait.Accountbook.Service.Ab_UpdateService"%>
<%@page import="kr.koreait.Accountbook.VO.AccountbookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.koreait.Accountbook.VO.AccountbookList"%>
<%@page import="kr.koreait.Accountbook.Service.Ab_SelectService"%>
<%@page import="kr.koreait.Accountbook.Service.Ab_WriteService"%>
<%@page import="kr.koreait.Accountbook.DAO.AccountbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeOK.jsp</title>
</head>
<body>
	<!-- write.jsp에서 쓴글을 db에 저장하고 id,pw로 글목록을 꺼내와 다시 write.jsp로 돌아간다. -->
	<%
		request.setCharacterEncoding("UTF-8");
		int mode = Integer.parseInt(request.getParameter("mode"));
		//String wdate = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		Date date = new Date();
		date.setYear(Integer.parseInt(request.getParameter("year"))-1900);
		date.setMonth(Integer.parseInt(request.getParameter("month"))-1);
		date.setDate(Integer.parseInt(request.getParameter("day")));
	%>
	<jsp:useBean id="vo" class="kr.koreait.Accountbook.VO.AccountbookVO">
		<jsp:setProperty property="*" name="vo" />
	</jsp:useBean>
	<%
	vo.setWdate(date);
	request.setAttribute("id", vo.getId());
	request.setAttribute("password", vo.getPassword());
	
	switch(mode) {
	case 1://저장하기
	System.out.println(vo);
		Ab_WriteService.getInstance().write(vo);//새로운 항목 저장
		pageContext.forward("loginOK.jsp");
		break;
	case 2://수정하기
		Ab_UpdateService.getInstance().update(vo);
		pageContext.forward("loginOK.jsp");
		break;
	}
	%>
</body>
</html>