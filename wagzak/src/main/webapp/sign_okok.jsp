<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE> 회원 인증 </TITLE> 
</HEAD>

<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover	{font-family:"";color:black;text-decoration:underline;}
-->
</style>

<BODY>  

<%
String phone = request.getParameter("phone");       
String pass = request.getParameter("pass");   

String sessionID = "yes";

try{

if (phone == "" || pass == "") {
	out.print("<Script> alert('携帯電話とパスワードを確認してください。');  history.back();</Script>");
} else {

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/project" ;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");
	Statement stmt = conn.createStatement();


	String strSQL = "SELECT * FROM members where phone='" + phone + "'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	rs.next();
	
	String logphone = rs.getString("phone");
	String logpass = rs.getString("pass");

	if (!phone.equals(logphone)){
			out.print("<Script> alert('携帯電話が一定しません。');  history.back();</Script>");
	} else { 
		if (!pass.equals(logpass)){
			out.print("<Script> alert('パスワードが一定しません。');  history.back();</Script>");
		} else {
			session.setAttribute("user",sessionID);
			String redirectUrl = "Main.jsp?phone=" + phone;
			response.sendRedirect(redirectUrl);
		}
	}	
}

} catch(Exception e){

out.print("<Script> alert('携帯電話が一定しません。');  history.back();</Script>");
}
%>

</BODY>
</HTML>