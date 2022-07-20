<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
	String phone = request.getParameter("phone");
	String pass = request.getParameter("pass");
	
	
	
	String check_ok = "yes";  
	if (phone == "")                 
		check_ok = "no";    
    
	if (pass == "")
		check_ok = "no";
	
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/project" ;
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");
	Statement stmt = conn.createStatement();
	
	String strSQL = "SELECT phone FROM members where phone='" + phone + "'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	if (!rs.next())           
		check_ok="yes";   
	else                    
		check_ok="no";    
	
	if (check_ok == "yes"){
		strSQL = "INSERT INTO members(phone,pass)";
		strSQL = strSQL +  "VALUES('" +phone+ "', '" + pass + "')";
		stmt.executeUpdate(strSQL);
	}
	response.sendRedirect("sign.jsp");
%>
