<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/css.css">
<link rel="stylesheet" href="${path}/resources/css/login.css">
<title>Sign In</title>
</head>
<script type="text/javascript">	
		function Check() {
			if (sign_input.phone.value.length < 1) {
				alert("携帯電話を入力してください。");
				sign_input.phone.focus();
				return false;
			}
		
			if (sign_input.pass.value.length < 1) {
				alert("パスワードを入力してください。");
				sign_input.pass.focus();
				return false;
			}
			sign.submit();
		}
</script>
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
	</div>
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
		<section>
		<form name="sign_input"  class="loginForm" method="post" Onsubmit='return Check()' action="sign_output.jsp" style="margin-top:300px;">
			<h2>新規会員登録</h2>
			
			<div class="idForm">
				<input type="text" class="id" name="phone" placeholder="携帯電話" maxlength = "11">
			</div>

			<div class="passForm">
				<input type="password" class="pw" name="pass" placeholder="パスワード" maxlength = "20">
			</div>
				<button type="submit" class="btn" onclick = "Check()">加入</button>
		</form>
		</section>
</body>
</html>