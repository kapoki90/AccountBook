<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enter Accountbook</title>
<link rel="stylesheet" type="text/css" href="forWrite.css">
<script type="text/javascript" src="set.js"></script>
<script type="text/javascript" src="BlankCheck.js"></script>
</head>
<body>
	<form action="writeOK.jsp" method="post" name="accountbookForm" onsubmit="return BlankCheck();">
		<table border="1" width="1200">
			<%-- <input type="hidden" name="sumOfCash" value="${sumOfCash}"> --%>
			<input type="hidden" name="mode" value="1" size="5" />
			<input type="hidden" name="idx" value="50" size="5" />
			<input type="hidden" name="id" value="${idpw.id}">
			<input type="hidden" name="password" value="${idpw.password}">
			<tr>
				<th colspan="7"><h2>enter accountbook</h2></th>
			</tr>

			<tr>
				<td width="350" align="center">date</td>
				<td width="200" align="center">expense/income</td>
				<td width="150" align="center">amount</td>
				<td width="70" align="center">currency</td>
				<td width="100" align="center">type of expenses</td>
				<td width="200" align="center">memo</td>
				<td width="230" align="center">card/cash</td>
			</tr>

			<tr>
			<td>
				year:<select id="year" name="year" size="1">
						<c:forEach var="i" begin="1990" end="2050" step="1">
							<c:choose>
								<c:when test="${i eq 2017}">
									<option selected="selected" value="2017">2017</option>
								</c:when>
								<c:otherwise>
									<option value="${i}">${i}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select>
				month:<select id="month" name="month">
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> 
				day:<select id="day" name="day">
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select>	
				
			</td>	

				<td><input type="radio" name="income_expense" id="expenseBtn" value="expense" checked="checked"> expense 
					<input type="radio" name="income_expense" id="incomeBtn" value="income"> income</td>

				<td><input type="text" name="amount" /></td>

				<td><select name="currency" size="1">
						<option value="(KRW)">(KRW)</option>
						<option value="(CAD)">(CAD)</option>
						<option value="(USD)">(USD)</option>
						<option value="(EUR)">(EUR)</option>
						<option value="(JPY)">(JPY)</option>
				</select></td>
				<td><select name="kind" size="1">
						<option value="etc">etc</option>
						<option value="meal">meal</option>
						<option value="Transportation">Transportation</option>
						<option value="Admission">Admission</option>
						<option value="room charge">room charge</option>
				</select></td>
				<td><input type="text" name="memo" /></td>

				<td><input type="radio" name="card_or_cash" id="card"
					value="card"> card <input type="radio" name="card_or_cash"
					id="cash" value="cash" checked="checked"> cash</td>
			</tr>

			<tr>
				<td colspan="7" align="center"><input type="submit"
					value="save" name="btnTitle" /> <input type="reset" value="reset" />
					<input type="button" value="Calener view"
					onclick="location.href='calendar.jsp?myid=${idpw.id}&mypassword=${idpw.password}'" />
					<input type="button" value="Log-out"
					onclick="location.href='login.jsp'" /></td>
			</tr>
		</table>

		<!-- 저장된 가계부 내용 보여주기 -->
		<table border="1" width="1000">
			<c:set var="list" value="${selected_list.getList()}" />
			<!-- 로그인성공시 메뉴탭을 보여준다. -->
			<c:if test="${list[0].kind!=null}">
				<tr>
					<td width="150" align="center">date</td>
					<td width="200" align="center">expense/income</td>
					<td width="230" align="center">amount</td>
					<td width="100" align="center">type of expenses</td>
					<td width="200" align="center">memo</td>
					<td width="230" align="center">card/cash</td>
					<td colspan="2" width="150" align="center">modify/delete</td>
				</tr>
			</c:if>

			<c:forEach var="show" items="${selected_list.getList()}">
				<%-- <c:if test="${show.kind!=null}"> --%>
				<tr>
					<fmt:setLocale value="en_US" />
					<td><fmt:formatDate value="${show.wdate}"
							pattern="yyyy.MM.dd(E)" /></td>
					<c:choose>
						<c:when test="${show.income_expense eq 'expense'}">
							<td class="expense">${show.income_expense}</td>
							<td class="expense">${show.amount}${show.currency}</td>
						</c:when>

						<c:otherwise>
							<td class="income">${show.income_expense}</td>
							<td class="income">${show.amount}${show.currency}</td>
						</c:otherwise>
					</c:choose>
					<td>${show.kind}</td>
					<td>${show.memo}</td>
					<td>${show.card_or_cash}</td>
					<td colspan="2"><input type="button" value="modify"
						onclick="set(2, ${show.idx}, 'modify', 
					'${show.income_expense}',${show.amount},'${show.currency}','${show.kind}','${show.memo}','${show.card_or_cash}')">
						<input type="button" value="delete"
						onclick="location.href='delete.jsp?idx=${show.idx}&id=${idpw.id}&password=${idpw.password}'"></td>
				</tr>
				<%-- </c:if> --%>
			</c:forEach>

			<!--income,expense합계,현금잔액 보여주기-->
			<c:set var="list" value="${selected_list.getList()}" />
			<!--첫 로그인시 아무런 값도 없으므로 화면에 표시하지 않는다.-->
			<c:if test="${list[0].kind!=null}">
				<tr>
					<td width="150" align="center" colspan="2">income:<input
						class="income" type="text" name="sum_of_income"
						value="${sum_of_income}" />
					<td width="150" align="center" colspan="2">total expenditure:<input
						class="expense" type="text" name="sum_of_expense"
						value="${sum_of_expense}" />
					<td width="150" align="center" colspan="3">a cash balance:<input
						class="income" type="text" name="sumOfCash" value="${sumOfCash}"></td>
				</tr>
			</c:if>
			<!--아무런 값이 없어도 income,expense합계,잔액을 계산해야하므로 hidden방식으로 처리해 writeok로0 값을 넘겨준다.-->
			<c:if test="${list[0].kind==null}">
				<tr>
					<input type="hidden" name="sum_of_income" value="${sum_of_income}">
					<input type="hidden" name="sum_of_expense"
						value="${sum_of_expense}">
					<input type="hidden" name="sumOfCash" value="${sumOfCash}">
				</tr>
			</c:if>

		<!-- 페이지 하이퍼링크 -->
<%-- 		<tr>
			<td><c:if test="${selected_list.getStartPage() > 10}">
			[<a href="loginOK.jsp?page=${list.getStartPage()-1}">이전</a>]
			</c:if></td>

			<td colspan="4" align="center"><c:forEach var="i"
					begin="${selected_list.startPage}" end="${selected_list.endPage}" step="1">
					<!-- 현재 페이지가 아닐경우 하이퍼링크처리 -->
			<c:if test="${i!=selected_list.currentPage}">
			[<a href="loginOK.jsp?page=${i}&id=${idpw.id}&password=${idpw.password}">${i}</a>]
			</c:if>
			<c:if test="${i==selected_list.currentPage}">
			[${i}]
			</c:if>
				</c:forEach></td>

			<td><c:if test="${selected_list.getEndPage() < selected_list.getTotalPage()}">
			[<a href="loginOK.jsp?page=${selected_list.getEndPage()+1}&id=${idpw.id}&password=${idpw.password}">다음</a>]
			</c:if></td>
		</tr> --%>
		
			<tr>
				<td align="center" colspan="6">
					<!-- startPage가 1 보다 크다면 이전 10 페이지가 있다. -->
					<c:if test="${selected_list.startPage > 1}">
						<input type="button" value="start" onclick="location.href='?page=1&id=${idpw.id}&password=${idpw.password}'"/>
						<input type="button" value="-10" onclick="location.href='loginOK.jsp?page=${selected_list.startPage-1}&id=${idpw.id}&password=${idpw.password}'"/>
					</c:if>
					<c:if test="${selected_list.startPage <= 1}">
						<input type="button" value="start" disabled="disabled"/>
						<input type="button" value="-10" disabled="disabled"/>
					</c:if>
					
					<!-- currentPage가 1보다 크면 이전 페이지가 있다. -->
					<c:if test="${selected_list.currentPage > 1}">
						<input type="button" value="-1" onclick="location.href='loginOK.jsp?page=${selected_list.currentPage-1}&id=${idpw.id}&password=${idpw.password}'"/>
					</c:if>
					<c:if test="${selected_list.currentPage <= 1}">
						<input type="button" value="-1" disabled="disabled"/>
					</c:if>
				
					<!-- 10페이지 단위로 페이지 이동 하이퍼링크를 출력한다. -->
					<c:forEach var="i" begin="${selected_list.startPage}" end="${selected_list.endPage}" step="1">
						<c:if test="${selected_list.currentPage == i}">
							<%-- [<span id="currentPage">${i}</span>] --%>
							<input type="button" value="${i}" class="button1" disabled="disabled">
						</c:if>
						<c:if test="${selected_list.currentPage != i}">
							<%-- [<a href="?page=${i}">${i}</a>] --%>
							<input type="button" value="${i}" onclick="location.href='loginOK.jsp?page=${i}&id=${idpw.id}&password=${idpw.password}'" class="button"> 
						</c:if>
					</c:forEach>
					
					<!-- currentPage가 totalPage 보다 작으면 다음 페이지가 있다. -->
					<c:if test="${selected_list.currentPage < selected_list.totalPage}">
						<input type="button" value="+1" onclick="location.href='loginOK.jsp?page=${selected_list.currentPage+1}&id=${idpw.id}&password=${idpw.password}'"/>
					</c:if>
					<c:if test="${selected_list.currentPage >= selected_list.totalPage}">
						<input type="button" value="+1" disabled="disabled"/>
					</c:if>
					
					<!-- endPage가 totalPage 보다 작으면 다음 10 페이지가 있다. -->
					<c:if test="${selected_list.endPage < selected_list.totalPage}">
						<input type="button" value="+10" onclick="location.href='loginOK.jsp?page=${selected_list.endPage+1}&id=${idpw.id}&password=${idpw.password}'"/>
						<input type="button" value="end" onclick="location.href='loginOK.jsp?page=${selected_list.totalPage}&id=${idpw.id}&password=${idpw.password}'"/>
						<!--
						<fmt:parseNumber var="viewPage" integerOnly="true" value="${(list.totalPage-1) / 10}"/>
						<c:set var="viewPage" value="${viewPage * 10 + 1}"/>
						<input type="button" value="end" onclick="location.href='?page=${viewPage}'"/>
						-->
					</c:if>
					<c:if test="${selected_list.endPage >= selected_list.totalPage}">
						<input type="button" value="+10" disabled="disabled"/>
						<input type="button" value="end" disabled="disabled"/>
					</c:if>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>