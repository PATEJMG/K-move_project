<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String id = request.getParameter("id");
String pw = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/project";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");
Statement stmt = conn.createStatement();
String strSQL = "SELECT * FROM hmembers where id='" + id + "'";

ResultSet rs = stmt.executeQuery(strSQL);

if(rs.next()){

String logid = rs.getString("id");
String logpass = rs.getString("pass");
String hospital =  rs.getString("hospital");
		
String redirectUrl = "Main.jsp";
if (!id.equals(logid)){
				out.print("<Script> alert('IDが一致していません。');  history.back();</Script>");
		} else { 
			if (!pw.equals(logpass)){
				out.print("<Script> alert('パスワードが一致していません。');  history.back();</Script>");
		} else {
			%>
			<jsp:useBean id="member" class="model.Member" />
			<jsp:setProperty name="member" property="id" value="id"/>
			<jsp:setProperty name="member" property="pw" value="pw"/>
			<jsp:setProperty name="member" property="hospital" value="hospital"/>
			
<%		session.setAttribute("signedUser", hospital);
		redirectUrl = "Main2.jsp";
		response.sendRedirect(redirectUrl);
		}
	}	    
	}
else{
	out.print("<Script> alert('IDが一致していません。');  history.back();</Script>");
}
%>
</body>
</html>