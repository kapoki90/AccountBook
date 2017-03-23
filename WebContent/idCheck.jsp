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
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="vo" class="kr.koreait.Accountbook.VO.AccountbookVO">
		<jsp:setProperty property="*" name="vo" />
	</jsp:useBean>

	<%
		System.out.println(vo);
		Boolean bool = Ab_JoinService.getInstance().id_check(vo);
		if (Ab_JoinService.getInstance().id_check(vo)) {
			out.println("<script>");
			out.println("alert('Username already taken. Please try another one')");
			out.println("location.href='join.jsp'");
			out.println("</script>");
			
			pageContext.forward("join.jsp");
		} else {
			out.println("<script>");
			out.println("alert('You can join')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
			pageContext.forward("login.jsp");
		}
	%>
</body>
</html>