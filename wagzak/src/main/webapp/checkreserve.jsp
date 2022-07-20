<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<%//1. 한글처리 & 받아온 파라미터 변수화
request.setCharacterEncoding("UTF-8");
String time = request.getParameter("time");

//3. joinIdCheck(ID)메서드
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/project" ;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");



String strSQL ="SELECT COUNT(time) FROM reserve";
PreparedStatement pstmt1 = null;
ResultSet rs1=null;
pstmt1 = conn.prepareStatement(strSQL);
rs1=pstmt1.executeQuery();
rs1.next();
int count = rs1.getInt("count(time)");
rs1.close();



strSQL ="SELECT time FROM reserve";										//
PreparedStatement pstmt = null;											//statement : sql 구문을 실행하겠다. Prepared 더 향상된
pstmt = conn.prepareStatement(strSQL);									//sql을 DB와 연결시키겠다
ResultSet rs=pstmt.executeQuery();										// select의 실행값을 executequery가 rs에 넘겨주겠다
if(rs.next()){															// rs.next 만약 결과가 있다면.
String goodtime = rs.getString("time").trim();	

for(int i=0; i<count; i++){												
if (time.equals(goodtime)){												
   out.print("予約できない時間です。");
   break;
}else{
   out.print("予約できる時間です。");
   break;
}
}
}
else{
	out.print("予約できる時間です。");
}
%>
