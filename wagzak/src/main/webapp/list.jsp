<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");            // 안하면 너 데베 오류 뜸
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/css.css">
<title>list</title>
<style>
table.a {
	margin-top:50px;
	position:relative;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	font-size:20px;
	margin-left: 15%;
    margin-right: 50%;
	
}

#padding {
	text-align:center;
}

table.a thead th {
	font-size:30px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 5px solid #036;
}

table.a tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
	font-size:30px;
}

table.a td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<% 
   String key = request.getParameter("key");
   String keyword=request.getParameter("keyword");
   
   String pageNum= request.getParameter("pageNum");
   if(pageNum==null){
      pageNum="1";
   }
   
   int listSize=10;
   int currentPage=Integer.parseInt(pageNum);
   int startRow=(currentPage -1)* listSize + 1;
   int endRow = startRow + listSize -1;
   int lastRow = 0;
   int i = 0;

   String strSQL = "";
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/project" ;
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1111");
      
   Statement stmt = conn.createStatement();
   ResultSet rs = null;
   
   if(key==null || keyword==null){
    strSQL ="SELECT count(*) FROM hospital";
   }else{
    strSQL="SELECT count(*) FROM hospital WHERE location = '"+key+"' and  h like '%" +keyword+"%'";
   }
   rs =stmt.executeQuery(strSQL);
   rs.next();
   lastRow=rs.getInt(1);
   
%>
<div id="container">
	<header>
          <div id="logo">
            <a href="/">Y ・ N</a>
        </div>
			<div class="menubar"> <!-- 메뉴판  div -->
				 <ul>
			      <li><a href="sign.jsp">ログイン</a></li>
			      <li><a href="Dmain.jsp">予約</a></li>
			     　　<li><a href="check_front.jsp">予約確認</a></li>
			      <li><a href="list.jsp">地域による病院</a></li>
			      <li><a href="propile.jsp">このサイトについて</a></li>
			    </ul>
	   		</div>
	   		
	</header>
</div>


<div style="margin-top:30px;margin-buttom:50px;position:relative; padding:20px;">
   <form method="post" name="form" action="list.jsp">
      <fieldset style="text-align:center; padding:10px">         
            <h1 style="font-size:40px; color: #369;">検索</h1>
               <select name = 'key'style="width:100px; height:50px; font-size:20px ">
                           <option value = "北海道">北海道</option>
                            <option value = "?東">関東</option>
                            <option value = "中部">中部</option>
                            <option value = "?西">関西</option>
                            <option value = "中?">中国</option>
                            <option value = "九州">九州</option>
                            <option value = "四?">四国</option>               
                    </select>
                      <span>
                      <input type = "text" name = "keyword" value="" style="width:600px; height:50px; font-size:20px;">
                      </span>
                      <input type = "submit" value = "検索" style="font-size:20px; width:80px; height:50px;">     
                       
      </fieldset>        
   </form>   
</div>   

        <div style="margin-bottom:50px;">
			<table class="a" style="width:60%; text-align:center; margin-top:50px;position:relative;padding-top:50px;">
				<thead id="padding" style="width:60%; font-size:40px;">
					<tr>
					　　<th style="width:20%;">地域</th>
						<th>病院名</th>
						<th>Tel</th>
						
					</tr>
				</thead>
				<tbody >
<%
      if(lastRow >0) { 
         if(key==null || keyword==null){
            strSQL = "SELECT * FROM hospital WHERE h_num BETWEEN " +startRow+" and " +endRow; 
            
         }else{
            strSQL="SELECT * FROM hospital WHERE location = '"+key+"' and  h like '%" +keyword+"%'";   
         }
         rs= stmt.executeQuery(strSQL);
      
      for(i = 0; i< listSize; i++){
         if(rs.next()){
        	 String location = rs.getString("location");
            String name = rs.getString("h");
            String h_phone = rs.getString("h_phone");
            
%>
               <tr>
                  <td align=center style="font-size:20px;"><%=location%></td>
                 　		  <td align=center style="font-size:20px;"><%=name%></td>
                  <td align=center style="font-size:20px;"><%=h_phone%></td>
               </tr>
            <%
            }
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
                  <a href='list.jsp?pageNum=<%=currentPage-1 %>'>[以前]</a>
               <%
            }
            while(setPage <= lastPage){
               %>
                  <a href='list.jsp?pageNum=<%=setPage %>'>[<%=setPage %>]</a>
               <%
                  setPage = setPage +1;
               }
               if(lastPage > currentPage){
               %>
                  <a href='list.jsp?pageNum=<%=currentPage+1 %>'>[次]</a>
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