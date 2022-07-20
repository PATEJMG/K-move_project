<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/css.css">
<link rel="stylesheet" href="${path}/resources/css/box.css">
<meta charset="utf-8">
<title>Reserve</title>
<script>

function checkValue() {
	var form = document.userInfo;
	
	if(form.reserve_check.value != "中腹確認") {
		alert("中腹確認をしてください。");
		return false;
	}
}


function Check() {
	var selectoption = document.getElementById("select_check");
	selectoption = selectoption.options[selectoption.selectedIndex].value;
	
	var send = "checkreserve.jsp?time=" + selectoption;
	//"checkreserve.jsp?"
	window.name = "ReserveCheckForm";
    window.open(send, "reserve_ok",
            "width=400, height=350,resizable = no , scrollbars = no");
}

</script>
</head>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

%>
<body>
	<div id="container" style="width:100%">
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
		
		<nav>
			<div class="section">
				<input type="radio" name="slide" id="slide01" checked> <input
					type="radio" name="slide" id="slide02"> <input type="radio"
					name="slide" id="slide03">
				<div class="slidewrap">

					<ul class="slidelist">
					</ul>
				</div>
			</div>
		</nav>

		<div id="div">
			<form name='reserve1' method='post'
				action='Dwrite_ok.jsp?&year=<%=year%>&month=<%=month%>&day=<%=day%>'>
				<nav id="nav">
					<br>
					<p>
					<center>
						<font size='10'><b>診療予約</b></font>
					</center>
					</p>
				</nav>

				<aside>
					<div id="location" align="center">
						<h1>①病院地域を選択</h1>
						<span>ご希望の病院を選びください。</span>
						<!--  -->
	<select id="lo" name="lo" onchange="loadHo();"></select>
    <select id="ho" name="ho"></select>
	<script>
	let lo = [
						            {v:"北海道",t:"北海道"},
						            {v:"東北",t:"東北"},
						            {v:"関東",t:"関東"},
						            {v:"中部",t:"中部"},
						            {v:"関西",t:"関西"},
						            {v:"中国",t:"中国"},
						            {v:"四国",t:"四国"},
						            {v:"九州",t:"九州"}
						        ];
						        
						        let hospital_1 = [
						        	{v:"小樽市立病院",t:"小樽市立病院"},
						        	{v:"北海道大学病院",t:"北海道大学病院"},
						        	{v:"市立札幌病院",t:"市立札幌病院"},
						        	{v:"JR札幌病院",t:"JR札幌病院"},
						        	{v:"市立千歳市民病院",t:"市立千歳市民病院"},
						        	{v:"市立旭川病院",t:"市立旭川病院"},
						        	{v:"市立根室病院",t:"市立根室病院"},
						        	{v:"市立稚内病院",t:"市立稚内病院"}
						        ];
						        
						        let hospital_2 = [
						            {v:"岩手県立軽米病院",t:"岩手県立軽米病院"},
						            {v:"花北病院",t:"花北病院"},
						            {v:"猪苗代病院",t:"猪苗代病院"},
						            {v:"広南病院",t:"広南病院"},
						            {v:"町立真室川病院",t:"町立真室川病院"},
						            {v:"リハビリテーション病院",t:"リハビリテーション病院"}
						        ];
						        
						        let hospital_3 = [
						            {v:"東京大学医学部附属病院",t:"東京大学医学部附属病院"},
						            {v:"大久保病院",t:"大久保病院"},
						            {v:"東京西徳洲会病院",t:"東京西徳洲会病院"},
                                    {v:"慶應義塾大学病院",t:"慶應義塾大学病院"},
                                    {v:"東京都立神経病院",t:"東京都立神経病院"},
                                    {v:"聖路加国際病院",t:"聖路加国際病院"},
                                    {v:"聖母病院",t:"聖母病院"}
						        ];
						        let hospital_4 = [
						            {v:"相澤病院",t:"相澤病院"},
						            {v:"富山厚生連 高岡病院",t:"富山厚生連 高岡病院"},
						            {v:"富士宮市立病院",t:"富士宮市立病院"},
                                    {v:"下仁田厚生病院",t:"下仁田厚生病院"},
                                    {v:"公立陶生病院",t:"公立陶生病院"},
                                    {v:"山下病院",t:"山下病院"},
                                    {v:"名古屋セントラル病院",t:"名古屋セントラル病院"}
						        ];
						        let hospital_5 = [
						            {v:"住友病院",t:"住友病院"},
						            {v:"淀川キリスト教病院",t:"淀川キリスト教病院"},
						            {v:"大阪大学医学部附属病院",t:"大阪大学医学部附属病院"},
                                    {v:"京都府立医科大学附属病院",t:"京都府立医科大学附属病院"},
                                    {v:"日本京都第一赤十字病院",t:"日本京都第一赤十字病院"},
                                    {v:"京都市立病院",t:"京都市立病院"},
                                    {v:"名古屋セントラル病院",t:"名古屋セントラル病院"}
						        ];

						        let hospital_6 = [
						            {v:"大田市立病院",t:"大田市立病院"},
						            {v:"智頭病院",t:"智頭病院"},
                                    {v:"日本赤十字社 姫路赤十字病院",t:"日本赤十字社 姫路赤十字病院"},
                                    {v:"倉敷紀念病院",t:"倉敷紀念病院"},
                                    {v:"市立三次中央病院",t:"市立三次中央病院"},
                                    {v:"呉やけやま病院",t:"呉やけやま病院"},
                                    {v:"美祢市立病院",t:"美祢市立病院"},
                                    {v:"萩むらた病院",t:"萩むらた病院"},
						            {v:"医療法人至誠会 梅田病院",t:"医療法人至誠会 梅田病院"}
						        ];
						        let hospital_7 = [
						            {v:"朝倉病院",t:"朝倉病院"},
						            {v:"日本赤十字社高松赤十字病院",t:"日本赤十字社高松赤十字病院"},
						            {v:"西予市立西予市民病院",t:"西予市立西予市民病院"},
                                    {v:"石村病院",t:"石村病院"},
                                    {v:"愛媛県立中央病院",t:"愛媛県立中央病院"},
                                    {v:"松山西病院",t:"松山西病院"},
                                    {v:"波方中央病院",t:"波方中央病院"}
						        ];
						        let hospital_8 = [
						            {v:"マリン病院",t:"マリン病院"},
						            {v:"木村病院",t:"木村病院"},
						            {v:"公立九州中央病院",t:"公立九州中央病院"},
						            {v:"産業イガク病院",t:"産業イガク病院"},
						            {v:"日野病院",t:"日野病院"},
						            {v:"クロキ記念病院",t:"クロキ記念病院"},
						            {v:"熊本ダイガク病院",t:"熊本ダイガク病院"},
						            {v:"熊本中央病院",t:"熊本中央病院"},
						            {v:"サクラジマ病院",t:"サクラジマ病院"},
						            {v:"オキナワケン立北部病院",t:"オキナワケン立北部病院"},
						            {v:"琉球ダイガク病院",t:"琉球ダイガク病院"},
						            {v:"友愛イリョウセンタ",t:"友愛イリョウセンタ"},
						            {v:"松山西病院",t:"松山西病院"},
						            {v:"オリブ山病院",t:"オリブ山病院"},
						            
						        ];
						        
						        function loadLo() {
						            let h = [];
						            lo.forEach(item  => {
						                h.push('<option value="'+item.v+'">'+item.t+'</option>');
						            });
						            
						            document.getElementById("lo").innerHTML=h.join("");
						        }
						        
						        loadLo();

						        function loadHo() {
						        	let lo = document.getElementById("lo").value;
						        	let h = [];

						            if(lo == "") {

						            }else {
						                if(lo == "北海道") {
						                	hospital_1.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }else if(lo == "東北") {
						                	hospital_2.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }else if(lo == "関東") {
						                	hospital_3.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }else if(lo == "中部") {
						                	hospital_4.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }else if(lo == "関西") {
						                	hospital_5.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }else if(lo == "中国") {
						                	hospital_6.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }else if(lo == "四国") {
						                	hospital_7.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }else if(lo == "九州") {
						                	hospital_8.forEach(item  => {
						                        h.push('<option value="'+item.v+'">'+item.t+'</option>');
						                    });
						                }
						                
						            }
						            document.getElementById("ho").innerHTML=h.join("");
						        }
						        
						        loadHo();                       
        </script>
					</div>
				</aside>

				<section>
					<div id="section" align="center">
						<h1>②希望診療選択</h1>
						<span>ご希望の分野を選びください。</span>
									<select name="ward">
										<option selected>診療希望の分野</option>
										<option value="内科">内科</option>
										<option value="外科">外科</option>
										<option value="整形外科">整形外科</option>
										<option value="精神科">精神科</option>
										<option value="眼科">眼科</option>
										<option value="歯科">歯科</option>
										<option value="皮膚科">皮膚科</option>
										<option value="産婦人科">産婦人科</option>
										<option value="家庭医学科">家庭医学科</option>
										<option value="美容外科">美容外科</option>
										<option value="麻酔科">麻酔科</option>
										<option value="老人病内科">老人病内科</option>
										<option value="耳鼻咽喉科">耳鼻咽喉科</option>
										<option value="神經外科">神經外科</option>
										<option value="成形外科">成形外科</option>
										<option value="小児科">小児科</option>
										<option value="胸部外科">胸部外科</option>
								</select>

				</section>

				<aside1>
				<div id="time" align="center">
					<h2>③希望時間選択</h2>
					<span>希望時間を選びください。</span>


									<select name='Rtime' id="select_check">
										<option selected>診療希望時間を選択</option>
										<option value='9'>9時</option>
										<option value='10'>10時</option>
										<option value='11'>11時</option>
										<option value='12'>12時</option>
										<option value='13'>13時</option>
										<option value='14'>14時</option>
										<option value='15'>15時</option>
										<option value='16'>16時</option>
										<option value='17'>17時</option>
										<option value='18'>18時</option>
										<option value='19'>19時</option>
										<option value='20'>20時</option>
										<option value='21'>21時</option>
										<option value='22'>22時</option>
										<option value='23'>23時</option>
									<!-- </select> <select name='s_minute'>
										<option selected>분</option>
										<option value='00'>00</option>
										<option value='30'>30</option>
									</select> --> <input type='button' OnClick='Check()' value='中腹確認'>
											 <!--  <input type="hidden" name="reserve_check" value="reserveUncheck"> -->


				</div>

				</aside1>

				<section1>
						<center><br>④お名前とお電話番号を書いてください。</center>
						
				<center>
					<br>	
							<td bgcolor='ededed'><font size='4'><b><%=year%>年<%=month%>月<%=day%>日</b></font></td>
							<td height='40' colspan='2'>
							<p align='center'>
							<input type="text" class="id" name="name" placeholder="お名前">
							<input type="text" class="id" name="phone" placeholder="お電話番号">
							<input type='submit' value='予約'>
				</center>
				</section1>
				<footer><p class="copyright">&copy; Y・N service All Right Reserved.</p></footer>
			</form>
		</div>
</body>
</html>