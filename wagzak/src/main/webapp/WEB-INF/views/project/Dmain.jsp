<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="${path}/resources/css/css.css" >
<meta charset="utf-8">
<title>Reserve</title>
<SCRIPT LANGUAGE="JavaScript">
	function toggle(e) {
		if (e.style.visibility == "hidden") {
			e.style.top = event.y;
			e.style.left = event.x;
			e.style.visibility = "visible";
		} else {
			e.style.visibility = "hidden";
		}
	}
</SCRIPT>
<style>
#tt:hover {
	color: white;
	background-color: #6BEC62;
}

#tt {
	background-color: #ffffff;
	width: 50px;
	padding: 10px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="container">
		<header>
			<div id="logo">
				<a href="Main.jsp">Y ・ N</a>
			</div>
			<div class="menubar">
				<!-- 메뉴판  div -->
				<ul>
					<li><a href="sign.jsp">ログイン</a></li>
			      <li><a href="Dmain.jsp">予約</a></li>
			     　　<li><a href="check_front.jsp">予約確認</a></li>
			      <li><a href="list.jsp">地域による病院</a></li>
			      <li><a href="propile.jsp">このサイトについて</a></li>
				</ul>
			</div>
		</header>
		<nav>
			<div class="section">
				<input type="radio" name="slide" id="slide01" checked> <input
					type="radio" name="slide" id="slide02"> <input type="radio"
					name="slide" id="slide03">
				<div class="slidewrap">

					<ul class="slidelist">
					</ul>
				</div>
			</div>
		</nav>
		<%
			Calendar cal = Calendar.getInstance();

		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);

		if (strYear != null && strYear == null) {
			year = Integer.parseInt(strYear);
			month = Integer.parseInt(strMonth);
		}

		cal.set(year, month, 1);
		int startDay = cal.getMinimum(Calendar.DATE);
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int start = cal.get(Calendar.DAY_OF_WEEK);

		int newLine = 0;
		int j = 0;

		try {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));

			if (month >= 12) {
				year++;
				month = 0;
			} else if (month <= 0) {
				year--;
				month = 11;
			}
		} catch (Exception e) {

		}
		%>

		<section id='mingi'>

			<div align='center' style="padding-top: 100px;">
				<center>
					<font size='5'><b>一定管理</b></font>
					<TABLE border='0' width='800' cellpadding='0' cellspacing='0'>
						<TR>
							<td><hr size='1'></td>
						</TR>
					</TABLE>
					<br>

					<TABLE width="500px">
						<tr>
							<td><a href="Dmain.jsp?year=<%=year - 1%>&month=<%=month%>">◀</a>
								<STRONG><%=year%>年 </STRONG> <a
								href="Dmain.jsp?year=<%=year + 1%>&month=<%=month%>">▶</a></td>
							<TD><DIV align='center'>
									<a href="Dmain.jsp?year=<%=year%>&month=<%=month - 1%>">◀</a> <STRONG><%=month + 1%>月</STRONG>
									<a href="Dmain.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a>
								</DIV></TD>
							<TD>
								<DIV align="right">
									<a href=Dmain.jsp></a><STRONG><%=year + "-" + (month + 1) + "-" + date%></STRONG>
								</DIV>
							</TD>
						</tr>
					</TABLE>
					<BR>

					<TABLE width="800px">
						<TR>
							<TD width='14%' height='34' align='center' bgcolor='ffffff'>
								<DIV align="center">
									<font color=red>日</font>
								</DIV>
							</TD>
							<TD width='14%' height='34' align='center' bgcolor='ffffff'>
								<DIV align="center">月</DIV>
							</TD>
							<TD width='14%' height='34' align='center' bgcolor='ffffff'>
								<DIV align="center">火</DIV>
							</TD>
							<TD width='14%' height='34' align='center' bgcolor='ffffff'>
								<DIV align="center">水</DIV>
							</TD>
							<TD width='14%' height='34' align='center' bgcolor='ffffff'>
								<DIV align="center">木</DIV>
							</TD>
							<TD width='14%' height='34' align='center' bgcolor='ffffff'>
								<DIV align="center">金</DIV>
							</TD>
							<TD width='14%' height='34' align='center' bgcolor='ffffff'>
								<DIV align="center">
									<font color=blue>土 </font>
								</DIV>
							</TD>
						</TR>
						<%
							for (int index = 1; index < start; index++) {
							out.print("<TD>&nbsp;</TD>");
							newLine++;
						}

						for (int index = 1; index <= endDay; index++) {
							String color = (newLine == 0) ? "RED" : "BLACK";
						%>
						<TD width='14%' height='70' align='center' valign='top' id="tt">
							<font size='2'><b><a
									href='Dwrite.jsp?year=<%=year%>&month=<%=month + 1%>&day=<%=index%>'>予約
										<font color=<%=color%>><%=index%></font>
								</a></b></font> </TD> 

						<%
							newLine++;

						if (newLine == 7) {
							out.print("</TR>");
							if (index <= endDay) {
								out.print("<TR>");
							}

							newLine = 0;
						}
						}

						while (newLine > 0 && newLine < 7) {
						out.print("<TD>&nbsp;</TD>");
						newLine++;
						}
						%>

					</TABLE>
			</div>
		</section>
		<div style="margin:100px;"></div>
		<footer>
   		<p class="copyright">&copy; Y・N service All Right Reserved.</p>
  	</footer>
</body>
</html>