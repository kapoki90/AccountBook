<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="passwordCheck.js"></script>
</head>
<body>
	<form action="joinOK.jsp" method="post" name="join_form">
		<table border="1" width="400" align="center">
			<tr>
				<input type="hidden" value="join" name="work"/>
				<th colspan="2"><h2>Join</h2></th>
			</tr>
			<tr>
				<td>Id: <input type="text" name="id" value="${id}">
				<input type="submit" name="id_chk" value="duplication check" onclick="return settingWork('idCheck')"/><br/>
				<LABEL for="checkReuslt">&nbsp;&nbsp;&nbsp; ${checkReuslt}</LABEL><br/>
					Passwrod : <input type="password" name="password"><br/>
					Comfirm Passwrod: <input type="password" name="password2">
				</td>
				<td><input type="submit" name="join_btn" value="Join" onclick="return passwordCheck()"><br/><br/>
					<input type="reset" value="Reset"><br/><br/>
					<input type="button" name="back_btn" value="Back" onclick="location.href='login.jsp'"><br/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>