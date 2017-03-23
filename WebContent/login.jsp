<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="passwordCheck.js"></script>
</head>
<body>
	<form action="loginOK.jsp" name="Login_form" method="post" onsubmit="return passwordCheckLogin();">
		<table border="1" width="400" align="center">
			<tr>
				<th colspan="2"><h2>account book for travel - Login</h2></th>
			</tr>
			<tr>
				<td>Id : <input type="text" name="id"><br/>
				<br/>Password : <input type="password" name="password">
				</td>
				<td><input type="submit" name="login_btn" value="Login"/><br/>
				<br /> <input type="button" name="join_btn" value="Join"
					onclick="location.href='join.jsp'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>