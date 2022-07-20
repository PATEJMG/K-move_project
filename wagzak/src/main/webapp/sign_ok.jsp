<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/menubar.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<link rel="stylesheet" href="${path}/resources/css/mainlist.css">
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
				<input type="radio" name="slide" id="slide01" checked>
				<input type="radio" name="slide" id="slide02">
				<input type="radio" name="slide" id="slide03">
				<div class="slidewrap">
				
					<ul class="slidelist">
						<!-- 슬라이드 영역 -->
						<li class="slideitem">
							<a>
								<div class="textbox">
									<h3 style="color:black;">福岡市病院</h3>
									<p style="color:black;">内科で有名な病院</p>
								</div>
								
								<img src="file:///C:/Users/sith7/eclipse-workspace/수업/WebContent/jpg2/1.jpg">
							</a>
						</li>
						<li class="slideitem">
							<a>								
								<div class="textbox">
									<h3>東京市病院</h3>
									<p>内科で有名な病院</p>
								</div>
								<img src="file:///C:/Users/sith7/eclipse-workspace/수업/WebContent/jpg2/2.jpg">
							</a>
						</li>
						<li class="slideitem">
							<a>
								
								<div class="textbox">
									<h3>大阪市病院</h3>
									<p>内科で有名な病院</p>
								</div>
								<img src="file:///C:/Users/sith7/eclipse-workspace/수업/WebContent/jpg2/3.jpg">
							</a>
						</li class="slideitem">
			
						<!-- 좌,우 슬라이드 버튼 -->
						<div class="slide-control">
							<div>
								<label for="slide03" class="left"></label>
								<label for="slide02" class="right"></label>
							</div>
							<div>
								<label for="slide01" class="left"></label>
								<label for="slide03" class="right"></label>
							</div>
							<div>
								<label for="slide02" class="left"></label>
								<label for="slide01" class="right"></label>
							</div>
						</div>
			
					</ul>
					<!-- 페이징 -->
					<ul class="slide-pagelist">
						<li><label for="slide01"></label></li>
						<li><label for="slide02"></label></li>
						<li><label for="slide03"></label></li>
					</ul>
				</div>	
			</div>
	<!-- 배너 끝 -->
	</nav>
	<main>
	<div id="center1">
		<a href="#" class="button" id="hotkaido">北海道病院</a>
		<a href="#" class="button" id="tohoku">道北病院</a>
		<a href="#" class="button" id="kanto">関東病院</a>
		<a href="#" class="button" id="chubu">中部病院</a>
		<a href="#" class="button" id="kansai">関西病院</a>
		<br><br>
		<a href="#" class="button" id="chugoku">中国病院</a>
		<a href="#" class="button" id="shikoku">四国病院</a>
		<a href="#" class="button" id="kyushu_okinawa">九州・沖縄 病院</a>
	</div>
	</main>	
	<footer>
   		<p class="copyright">&copy; Y・N service All Right Reserved.</p>
  	</footer>
</div>
</body>
</html>