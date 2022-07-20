<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*, java.util.*"%>
   <%
request.setCharacterEncoding("UTF-8");  
   %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/css.css">
<link rel="stylesheet" href="${path}/resources/css/login.css">
<link rel="stylesheet" href="${path}/resources/css/list.css">

<meta charset="utf-8">
<title>予約確認サイト(病院専用)</title>

</head>
<body>
<div id="container">
      <header>
         <div id="logo">
            <a href="/">Y ・ N</a>
         </div>
         <div class="menubar">
            <!-- 메뉴판  div -->
            <!-- 깃허브 연습 -->
            <ul>
              <li><a href="/">ログアウト</a></li>
              　　<li><a href="check_front.jsp">予約確認</a></li>
               <li><a href="list.jsp">地域による病院</a></li>
               <li><a href="propile.jsp">このサイトについて</a></li>
            </ul>
         </div>
      </header>
<%


String pageNum= request.getParameter("pageNum");
if(pageNum==null){
   pageNum="1";
}

int listSize=8;
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage -1)* listSize + 1;
int endRow = startRow + listSize -1;
int lastRow = 0;
int i = 0;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/project";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");
Statement stmt = conn.createStatement();
String strSQL = "SELECT * FROM reserve WHERE hospital= '"+ session.getAttribute("signedUser")+"'";
ResultSet rs = stmt.executeQuery(strSQL);

%>
<div style="text-align:center; font-size:40px; margin-top:100px;">
   <p> <%="["+session.getAttribute("signedUser")+"]" %>の予約</p>
</div>
<div style="margin-bottom:50px; margin-right: 100px; margin-left: 50px; margin-bottom:100px;">
         <table class="a" style="width:80%; text-align:center; margin-top:50px;position:relative;padding-top:50px; ">
            <thead id="padding" style="width:80%; font-size:20px;">
               <tr>
                  <th>患者名前</th>
                  <th>電話番号</th>
                  <th>分野</th>
                  <th>予約日</th>
                  <th>予約時間</th>
               </tr>
            </thead>
            <tbody >
<%
      for(i = 0; i< listSize; i++){
            if(rs.next()){
               lastRow=rs.getInt(1);
               String h = rs.getString("hospital");
               String loc = rs.getString("location");
               String ward = rs.getString("ward");
               String name1 = rs.getString("name");
               String phone1 = rs.getString("phone");
               String year = rs.getString("year");
               String month = rs.getString("month");
               String day = rs.getString("day");
               String time = rs.getString("time");
               String no = rs.getString("no");

   %>
               <tr>
                 　       <td align=center style="font-size:20px;"><%=name1%></td>
                 <td align=center style="font-size:20px;"><%=phone1%></td>
                 <td align=center style="font-size:20px;"><%=ward%></td>
                 <td align=center style="font-size:20px;"><%=year+"年"+month+"月"+day+"日"%></td>
                 <td align=center style="font-size:20px;"><%=time%></td>
                 
               </tr>
            <%
            }
      }
%>
   </tbody>
         </table>
   </div>
   <div style="text-align:center; margin-bottom:100px;">  
   <%
                           
      rs.close();
      stmt.close();
      conn.close();
      if(lastRow > 0){
            int setPage = 1;
            int lastPage = 0;
            if(lastRow % listSize ==0)
               lastPage = lastRow / listSize;
            else
               lastPage = lastRow / listSize + 1 ;
            if(currentPage > 1){
               %>
                  <a href='HCheack.jsp?pageNum=<%=currentPage-1 %>'>[以前]</a>
               <%
            }
            while(setPage <= lastPage){
               %>
                  <a href='HCheack.jsp?pageNum=<%=setPage %>'>[<%=setPage %>]</a>
               <%
                  setPage = setPage +1;
               }
               if(lastPage > currentPage){
               %>
                  <a href='HCheack.jsp?pageNum=<%=currentPage+1 %>'>[次]</a>
               <%
                  }
               }
               %>

      </div>
      <footer>
         <p class="copyright">&copy; Y・N service All Right Reserved.</p>
     </footer>    
</body>
</html>