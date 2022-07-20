<%@ page contentType = "text/html; charset=utf-8" %>
 <%@ page import="java.sql.*, java.util.*,java.net.*"%>
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
String name = request.getParameter("name");       
String phone = request.getParameter("phone");   

String sessionID = "yes";

try{

if (name == "" || phone == "") {
	out.print("<Script> alert('お名前と携帯電話を入力してください。');  history.back();</Script>");
} else {

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/project" ;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");
	Statement stmt = conn.createStatement();


	String strSQL = "SELECT * FROM reserve where name='" + name + "' and phone="+phone;
	ResultSet rs = stmt.executeQuery(strSQL);
	
	rs.next();
	
	String logname = rs.getString("name");
	String logphone = rs.getString("phone");

	if (name.equals(logname) && phone.equals(logphone)){
		String name1 = URLEncoder.encode(name,"utf-8");
		response.sendRedirect("Check.jsp?name="+name1+"&&phone="+phone);}
		else{
			out.print("<Script> alert('"+name+"様のご予約はありません。 \\nもう一度お名前と携帯電話を確認してください。');  history.back();</Script>");
;
		} 
	}	


} catch(Exception e){

out.print("<Script> alert('"+name+"様のご予約はありません。\\nもう一度お名前と携帯電話を確認してください。');  history.back();</Script>");
}
%>

</BODY>
</HTML>