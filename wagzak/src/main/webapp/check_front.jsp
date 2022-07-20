<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
request.setCharacterEncoding("UTF-8");  
	%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/css.css">
<link rel="stylesheet" href="${path}/resources/css/login.css">

<meta charset="utf-8">
<title>ログインページ</title>
<script type="text/javascript">

	function Check() {
		if (sign.name.value.length < 1) {
			alert("お名前を入力してください。");
			sign.name.focus();
			return false;
		}

		if (sign.phone.value.length < 1) {
			alert("携帯電話を入力してください。");
			sign.phone.focus();
			return false;
		}
		sign.submit();
	}
</SCRIPT>
</head>
<body>
	<div id="container">
		<header>
			<div id="logo">
				<a href="/">Y ・ N</a>
			</div>
			<div class="menubar">
				<!-- 메뉴판  div -->
				<ul>
					<li><a href="sign.jsp">ログイン</a></li>
			      <li><a href="Dmain.jsp">予約</a></li>
			     　　<li><a href="check_front.jsp">予約確認</a></li>
			      <li><a href="list.jsp">地域による病院</a></li>
			      <li><a href="propile.jsp">このサイトについて</a></li>
			</div>
		</header>
		<div style="margin-top:300px;">
		<form name="sign" action="check_okok.jsp" class="loginForm" method="post"Onsubmit='return Check()' style="margin-top:300px;">
			<h2>予約確認</h2>
			<table>
				<div class="passForm">
					<input type="text" class="pw" name="name" placeholder="お名前">
				</div>
				
				<div class="idForm">
					<input type="text" class="id" name="phone" placeholder="携帯電話"  minlength = "11" maxlength = "11" >
				</div>

				<button type="submit" class="btn">確認</button>
			</table>
		</form>
  		</div>	
</body>
</html>