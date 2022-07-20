<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*, java.util.*,java.net.*"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String name = request.getParameter("name");       
String phone = request.getParameter("phone"); 
String num=request.getParameter("no");

PreparedStatement pstmt = null;
ResultSet rs=null;


String url = "jdbc:mysql://localhost:3306/project";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");
Statement stmt = conn.createStatement();
String strSQL = "SELECT * FROM reserve WHERE no='"+num+"'";
rs = stmt.executeQuery(strSQL);
if(rs.next()){
	strSQL="DELETE From reserve WHERE no=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1,Integer.parseInt(num));
	pstmt.executeUpdate();
	String name1 = URLEncoder.encode(name,"utf-8");
	response.sendRedirect("Check.jsp?name="+name1+"&&phone="+phone);
}else{
  out.print("<Script> alert('削除失敗');  history.back();</Script>");
	}
%>
</body>
</html>