<%@page import="java.util.StringTokenizer"%>
<%@page import="kr.koreait.Accountbook.VO.AccountbookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.koreait.Accountbook.Service.Ab_SelectService"%>
<%@page import="kr.koreait.calendar.MyCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>달력</title>
<link rel="stylesheet" href="calendarstyle.css">
</head>
<body>
	<%
		String receivedId = request.getParameter("myid");
		String receivedPwd = request.getParameter("mypassword");

		String wdate = request.getParameter("year") + "-" + request.getParameter("month") + "-"
				+ request.getParameter("day");

		ArrayList<AccountbookVO> allList = Ab_SelectService.getInstance().selectAll();
		//System.out.println(allList);

		/* 	for(AccountbookVO s : allList){
				int year = s.getWdate().getYear();
				int month = s.getWdate().getMonth();
				int day = s.getWdate().getDate();
			} */
		//db의 모든데이터에 있는 wdate변수에 저장된년,월,일을 가져온다.

		//	달력이 최초로 실행될 때 출력할 년, 월을 컴퓨터 시스템에서 받는다.
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;

		//	페이지 이동 하이퍼링크를 클릭했을 때 넘어오는 년, 월을 받는다.
		try {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			if (month <= 0) {
				year--;
				month = 12;
			}
			if (month >= 13) {
				year++;
				month = 1;
			}
		} catch (Exception e) {
		}
	%>
	<table width="700" align="center" border="0">
		<tr>
			<th><input type="button" value="previous"
				onclick="location.href='?year=<%=year%>&month=<%=month - 1%>&myid=<%=receivedId%>&mypassword=<%=receivedPwd%>'">
			</th>
			<th colspan="5"><a
				href="?year=<%=year%>&month=<%=month - 1%>&myid=<%=receivedId%>&mypassword=<%=receivedPwd%>">&lt;&lt;</a>
				<%=year%> / <%=month%> <a
				href="?year=<%=year%>&month=<%=month + 1%>&myid=<%=receivedId%>&mypassword=<%=receivedPwd%>">&gt;&gt;</a></th>
			<th>
				<%-- <%
			out.println("<input type='button' value='다음달' onclick='location.href=\"?year=" + year 
					+ "&month=" + (month+1) + "\"'>");
%> --%> <input type="button" value="next"
				onclick="location.href='?year=<%=year%>&month=<%=month + 1%>&myid=<%=receivedId%>&mypassword=<%=receivedPwd%>'">
			</th>
		</tr>
		<tr>
			<td class="sun">Sun</td>
			<td class="etc">Mon</td>
			<td class="etc">Tue</td>
			<td class="etc">Wed</td>
			<td class="etc">Thu</td>
			<td class="etc">Fri</td>
			<td class="sat">Sat</td>
		</tr>
		<tr>
			<%
				int start = MyCalendar.weekDay(year, month, 1);
				//	1일이 출력될 요일의 위치를 맞추기 위해 1일의 요일만큼 반복하며 빈 칸을 출력한다.
				//	for(int i=1 ; i<=start ; i++) {
				//		out.println("<td>&nbsp;</td>");
				//	}

				//	1일이 출력되기 전에 전달의 날짜를 출력한다.
				int count;
				if (month == 1) {
					count = MyCalendar.lastDay(year - 1, 12) - start + 1;
				} else {
					count = MyCalendar.lastDay(year, month - 1) - start + 1;
				}
				for (int i = 1; i <= start; i++) {
					out.println("<td class='before'>" + (month == 1 ? 12 : month - 1) + "/" + count++ + "</td>");
				}

				//	1일 부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력한다.
				//	데이터 한 건에 저장된 년,월,일이 같다면 지출,수입을 해당 날짜에 출력한다.

				int week = 0;
				//String calendarAmount="";
				for (int i = 1; i <= MyCalendar.lastDay(year, month); i++) {
					StringBuilder sb = new StringBuilder("");
					String myColor = "blue";
					//db의 모든데이터에 있는 wdate변수에 저장된년,월,일을 가져와 달력과 일치하는 날에 수입,지출금액 출력
					//문제:같은날짜에 여러 데이터가 있는경우 처리
					for (AccountbookVO s : allList) {
						int dbYear = s.getWdate().getYear() + 1900;
						int dbMonth = s.getWdate().getMonth() + 1;
						int dbDay = s.getWdate().getDate();
						String currency = s.getCurrency();

						if (dbYear == year && dbMonth == month && dbDay == i && currency != null) {
							if (s.getIncome_expense().trim().equals("expense")) {
								myColor = "red";
							}else{
							 	myColor = "blue";
							}
							sb.append(myColor + ",");
							sb.append(String.valueOf(s.getAmount())+String.valueOf(s.getCurrency()) + ",");
						}
					}

					String newSb = sb.toString();//StringBuilder를 StringTokenizer객체에 넣기위해 문자열로 변경
					StringTokenizer tokens = new StringTokenizer(newSb, ",");
					System.out.println(newSb);

					week = MyCalendar.weekDay(year, month, i);//각 요일에 해당하는 정수값을 리턴한다.
/* 					if (month == 1 && i == 1) {
						out.println("<td class='hday'>" + i + "<br/><span>신정</span><br/>" + sb + "</td>");
					} else if (month == 3 && i == 1) {
						out.println("<td class='hday'>" + i + "<br/><span>삼일절</span><br/>" + sb + "</td>");
					} else if (month == 5 && i == 5) {
						out.println("<td class='hday'>" + i + "<br/><span>어린이날</span><br/>" + sb + "</td>");
					} else if (month == 6 && i == 6) {
						out.println("<td class='hday'>" + i + "<br/><span>현충일</span><br/>" + sb + "</td>");
					} else if (month == 8 && i == 15) {
						out.println("<td class='hday'>" + i + "<br/><span>광복절</span><br/>" + sb + "</td>");
					} else if (month == 10 && i == 3) {
						out.println("<td class='hday'>" + i + "<br/><span>개천절</span><br/>" + sb + "</td>");
					} else if (month == 10 && i == 9) {
						out.println("<td class='hday'>" + i + "<br/><span>한글날</span><br/>" + sb + "</td>");
					} else if (month == 12 && i == 25) {
						out.println("<td class='hday'>" + i + "<br/><span>크리스마스</span><br/>" + sb + "</td>");
					} else if (year == 2017 && month == 10 && i == 4) {
						out.println("<td class='hday'>" + i + "<br/><span>추석</span><br/>" + sb + "</td>");
					} else if (year == 2017 && month == 10 && i == 5) {
						out.println("<td class='hday'>" + i + "<br/><span>추석연휴</span><br/>" + sb + "</td>");
					} else if (year == 2017 && month == 10 && i == 6) {
						out.println("<td class='hday'>" + i + "<br/><span>대체공휴일</span><br/>" + sb + "</td>");
					} else { */

						switch (week) {
						case 0:
							out.println("<td class='sunday'><div>" + i + "</div>");
							for (int x = 1; tokens.hasMoreElements(); x++) {
								myColor = tokens.nextToken();
								out.println("<span style='color:" + myColor + "'>" + tokens.nextToken() + "</span><br/>");
							}
							out.println("</td>");
							break;
						case 6:
							out.println("<td class='satday'><div>" + i + "</div>");
							for (int x = 1; tokens.hasMoreElements(); x++) {
								myColor = tokens.nextToken();
								out.println("<span style='color:" + myColor + "'>" + tokens.nextToken() + "</span><br/>");
							}
							out.println("</td>");
							break;
						default:
							out.println("<td class='day'><div>" + i + "</div>");
							for (int x = 1; tokens.hasMoreElements(); x++) {
								myColor = tokens.nextToken();
								out.println("<span style='color:" + myColor + "'>" + tokens.nextToken() + "</span><br/>");
							}
							out.println("</td>");
						}
					//}

					//		출력한 날짜가 토요일이고 그 달의 마지막 날짜가 아니면 줄을 바꾼다.
					if (week == 6 && i != MyCalendar.lastDay(year, month)) {
						out.println("</tr><tr>");
					}

				}

				//	마지막 날짜의 다음 요일 부터 토요일 까지 반복하며 다음달의 날짜를 출력한다.
				count = 1;
				for (int i = week + 1; i < 7; i++) {
					out.println("<td class='after'>" + (month == 12 ? 1 : month + 1) + "/" + count++ + "</td>");
				}
			%>
		</tr>

		<tr>
			<td colspan="7">
				<form action="?" method="post">
					Year:<select name="year">
						<%
							for (int i = 1950; i <= 2050; i++) {
								if (i == calendar.get(Calendar.YEAR)) {
									out.println("<option selected='selected'>" + i + "</option>");
								} else {
									out.println("<option>" + i + "</option>");
								}
							}
						%>
					</select> Month:<select name="month">
						<%
							for (int i = 1; i <= 12; i++) {
								if (i == calendar.get(Calendar.MONTH) + 1) {
									out.println("<option selected='selected'>" + i + "</option>");
								} else {
									out.println("<option>" + i + "</option>");
								}
							}
						%>
					</select> <input type="submit" value="view" />
					<%
						out.println("<input type='button' value='Go accountbook'" + "onclick='location.href=\"loginOK.jsp?id=" + receivedId
								+ "&password=" + receivedPwd + "\"'/> ");
					%>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
















