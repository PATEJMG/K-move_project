<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会員専用</title>
</head>
<body>
<center><font size='3'><b>会員専用のページ</b></font></center>
<center><TABLE border ='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade></TD>
	</TR>
</TABLE>
<TABLE cellSpacing='0' cellPadding='30' align='center' border='0'>
<%
try{
	String strUser="yes";
	String strSession = session.getAttribute("user").toString();
	if ( !strUser.equals(strSession)) {

%>
	<TR>
		<TD align='center'><Font size='2'>ログインしてください。</Font></TD>
	</TR>
	<TR>
		<TD align='center'><a href="sign_page.jsp">[ログイン]</TD>
	</TR>
<%
	}else {

%>
	<TR>
		<TD align='center'><font size='2'>会員専用のページ</font></TD>
	</TR>
	<TR>
		<TD align='center'><font size='2'><a href="sign_page.jsp">このページは会員様のみに提供されるページです。</a></font></TD>
	</TR>
<%
	}
	}catch(NullPointerException e){
%>
	<TR>
		<TD align='center'><font size='2'>ログインしてください。</font></TD>
	</TR>
	<TR>
		<TD align='center'><a href="sign.jsp">[ログイン]</font></TD>
	</TR>
<%
}
%>

</TABLE>
</body>
</html>