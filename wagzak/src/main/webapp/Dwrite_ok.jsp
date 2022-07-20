<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
String hospital = request.getParameter("ho");
String location = request.getParameter("lo");
String ward = request.getParameter("ward");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String time = request.getParameter("Rtime");

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/project";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");

Statement stmt = conn.createStatement();
int no_plus = 0;
String strSQL2 = "SELECT no FROM reserve order by no DESC";
ResultSet rs1 = stmt.executeQuery(strSQL2);

if (rs1.next()) {
	strSQL2 = "SELECT Max(no) FROM reserve";
	rs1 = stmt.executeQuery(strSQL2);
	rs1.next();
	no_plus = rs1.getInt(1) + 1;
}

String strSQL = "INSERT INTO reserve(no,hospital,location,ward,name,phone,year,month,day,time) VALUES('";
strSQL = strSQL + no_plus + "','";
strSQL = strSQL + hospital + "','";
strSQL = strSQL + location + "','";
strSQL = strSQL + ward + "','";
strSQL = strSQL + name + "','";
strSQL = strSQL + phone + "','";
strSQL = strSQL + year + "','";
strSQL = strSQL + month + "','";
strSQL = strSQL + day + "','";
strSQL = strSQL + time + "')";

stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

int imonth = Integer.parseInt(month);

response.sendRedirect("Dmain.jsp?year=" + year);
%>