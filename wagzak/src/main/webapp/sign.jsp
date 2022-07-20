<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/css.css">
<link rel="stylesheet" href="${path}/resources/css/login.css">
<meta charset="utf-8">
<title>ログインページ</title>
<script type="text/javascript">

	function Check() {
		if (sign.id.value.length < 1) {
			alert("IDを入力してください。");
			sign.id.focus();
			return false;
		}

		if (sign.pass.value.length < 1) {
			alert("パスワードを入力してください。");
			sign.pass.focus();
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
				</ul>
			</div>
		</header>
		<nav>
			<div class="section">
				<input type="radio" name="slide" id="slide01" checked> <input
					type="radio" name="slide" id="slide02"> <input type="radio"
					name="slide" id="slide03">
				<div class="slidewrap">

					<ul class="slidelist"></ul>
				</div>
			</div>
		</nav>
		<div style="margin-top:300px;">
		<form name="sign" action="authentication.jsp" class="loginForm" method="post"Onsubmit='return Check()' style="margin-top:300px;">
			<h2>ログイン</h2>
			<table>
				<div class="idForm">
					<input type="text" class="id" name="id" placeholder="ID" maxlength = "20" >
				</div>

				<div class="passForm">
					<input type="password" class="pw" name="pass" placeholder="パスワード">
				</div>

				<button type="submit" class="btn">ログイン</button>
				</div>
			</table>
		</form>
  		</div>	
</body>
</html>