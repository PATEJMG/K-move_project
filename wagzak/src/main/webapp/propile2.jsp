<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/css.css">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <div id="container">
	<header>
          <div id="logo">
            <a href="/">Y ・ N</a>
        </div>
			<div class="menubar"> <!-- 메뉴판  div -->
				 <ul>
			     <li><a href="logout.jsp">ログアウト</a></li>
			     　　<li><a href="Check-h.jsp">予約確認</a></li>
			      <li><a href="list2.jsp">地域による病院</a></li>
			      <li><a href="propile2.jsp">このサイトについて</a></li>/li>
			    </ul>
	   		</div>
	</header>
	</div>
	<main>
	 <div style="text-align:center; margin-top:100px;">
	 	御社はお年寄りのためのより簡単な予約サイトを作りました。<br> <br>
	 	
	 	
	 	地域による病院を簡単に探すことができます。<br><br>
	 	そして、地域と病院名を選択して予約をすることができます。
	 	
	 	<br><br><br>
	 	<h1 style="font-size:30px;"> 下にあるバトンを使って予約ができます。</h1>
	 	
	 	<a href="Dmain.jsp" class="button" >予約しに行く</a>
	 </div>
	</main>
	<footer>
   		<p class="copyright">&copy; Y・N service All Right Reserved.</p>
  	</footer>
</body>
</html>