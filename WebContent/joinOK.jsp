<%@page import="kr.koreait.Accountbook.Service.Ab_JoinService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String work = request.getParameter("work");
	%>
	<jsp:useBean id="vo" class="kr.koreait.Accountbook.VO.AccountbookVO">
		<jsp:setProperty property="*" name="vo" />
	</jsp:useBean>
	<%
		//Boolean bool = Ab_JoinService.getInstance().id_check(vo);
		switch (work) {
		case "join":
			System.out.println("join");
			if (Ab_JoinService.getInstance().id_check(vo)) {
				out.println("<script>");
				out.println("alert('Username already taken. Please try another one.')");
				out.println("location.href='join.jsp'");
				out.println("</script>");

				//pageContext.forward("join.jsp");
			} else {
				Ab_JoinService.getInstance().join(vo);
				out.println("<script>");
				out.println("alert('Join success')");
				out.println("location.href='login.jsp'");
				out.println("</script>");
				//pageContext.forward("login.jsp");
			}
			break;

		case "idCheck":
			System.out.println("idCheck");
			if (Ab_JoinService.getInstance().id_check(vo)) {
				request.setAttribute("checkReuslt", "ID is already in use");
				pageContext.forward("join.jsp");
			} else {
				request.setAttribute("checkReuslt", "You can join us");
				request.setAttribute("id", vo.getId());//request영역으로 받아온 id를 다시 넘겨줌
				pageContext.forward("join.jsp");
			}
			break;
		}
		
	%>
</body>
</html>