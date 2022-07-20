<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/css.css?after">
<meta charset="utf-8">
<title>メインページ</title>
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
								
								<img src="resources/img/1.jpg"/>"
							</a>
						</li>
						<li class="slideitem">
							<a>								
								<div class="textbox">
									<h3>東京市病院</h3>
									<p>内科で有名な病院</p>
								</div>
								<img src="resources/img/2.jpg"/>"
							</a>
						</li>
						<li class="slideitem">
							<a>
								
								<div class="textbox">
									<h3>大阪市病院</h3>
									<p>内科で有名な病院</p>
								</div>
								<img src="resources/img/3.jpg"/>"
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
	<div id = "center1-1">
	<p>今週の優秀病院</p>
	</div>
	<div id="center1">
		<a href="https://www.huhp.hokudai.ac.jp/" class="button" id="hotkaido">北海道病院</a>
		<a href="https://www.web-clover.net/mamurogawa-byouin/" class="button" id="tohoku">道北病院</a>
		<a href="https://www.h.u-tokyo.ac.jp/" class="button" id="kanto">関東病院</a>
		<a href="https://nagoya-central-hospital.com/" class="button" id="chubu">中部病院</a>
		<a href="http://www.kyoto1-jrc.org/" class="button" id="kansai">関西病院</a>
		<br>
	</div>
	
	<div id = "center1-1">
	<p style="margin-top: 30px;">応急処置の方法</p>
	</div>
	
		<div class= "center2"  style="padding:20px; width:100%; height:315px; text-align:center; float:left;">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/J6FVMA45MQA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/HjNvPwrQrLI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</main>	
	<footer>
   		<p class="copyright">&copy; Y・N service All Right Reserved.</p>
  	</footer>
</div>
</body>
</html>