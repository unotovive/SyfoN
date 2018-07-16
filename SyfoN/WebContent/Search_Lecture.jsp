<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<title>講義一覧</title>
		<script src="https://unpkg.com/vue"></script>
		<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
		<meta http-equiv="content-type" charset="utf-8">
		<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
		<meta http-equiv="content-type" charset="utf-8">
	</head>

	<body>
		<div id="app">
			<div id="bar">
				<h1>SyfoN</h1>
			</div>
			<input type="checkbox" class="check" id="checked">
			<label class="menu-btn" for="checked">
				<span class="bar top"></span>
				<span class="bar middle"></span>
				<span class="bar bottom"></span>
			</label>
			<label class="close-menu" for="checked"></label>
			<nav class="drawer-menu">
                <ul>
                    <li>
                        <a href="TimeTableServ">トップページ</a>
                    </li>
                    <li>
                        <a href="Search_Lecture.jsp">講義一覧</a>
                    </li>
                    <li>
                        <a href="Mypagesev">マイページ</a>
                    </li>
                    <li>
                        <a href="Logout">ログアウト</a>
                    </li>
                </ul>
            </nav>
			<div id="mcontent">
				<div id="panel">
					<form action="SearchLecture" method="post">
						<div id="pageBodyLeft">
							<h2>講義一覧</h2>
							<table id="table">
								<tr>
									<td>教科名</td>
									<td>
										<input id="inputformSmall" type="text" name="lectureName" value="">
									</td>
								</tr>
								<tr>
									<td>教授名</td>
									<td>
										<input id="inputformSmall" type="text" name="professorName" value="">
									</td>
								</tr>
								<tr>
									<td>開講日</td>
									<td>
										<label>
											<select id="inputformSmall" name="day">
												<option value="">曜日を選択して下さい</option>
												<option value="monday">月</option>
												<option value="tuesday">火</option>
												<option value="wednesday">水</option>
												<option value="thursday">木</option>
												<option value="fryday">金</option>
											</select>
										</label>
									</td>
								</tr>
								<tr>
									<td>配当年</td>
									<td>
										<label>
											<select id="inputformSmall" name="haitoNen">
												<option value="">配当年を選択してください</option>
												<option value="1">1年</option>
												<option value="2">2年</option>
												<option value="3">3年</option>
												<option value="4">4年</option>
											</select>
										</label>
									</td>
								</tr>
								<tr>
									<td>開講期</td>
									<td>
										<label>
											<select id="inputformSmall" name="kaikoki">
												<option value="">学期を選択してください</option>
												<option value="zenki">前期</option>
												<option value="kouki">後期</option>
											</select>
										</label>
									</td>
								</tr>
								<!--  		<tr>
								<td><span class="checkbox-parts">履修済</span> <input
									id="checkbox" class="checkbox-input" type="checkbox" name=""
									value=""></td>
								<button v-on:click="search" type="submit">検索2</button>
								</td>
							</tr> -->
							</table>
							<button id="submit" type="submit">検索</button>
						</div>
					</form>
					<div id="pageBodyRight">
						<h2>検索結果</h2>
						<table class="tablem">
							<tr style="top:0;">
								<th width="8%">曜日</th>
								<th width="10%">時限</th>
								<th width="17%">配当年学期</th>
								<th width="55%">教科名</th>
								<th width="20%">教授名</th>
							</tr>
						</table>
						<div class="ovf">
							<table>
								<tr v-for="lec in jsonTest" @click="execPost('ToLecInfo', lec.id);return false;" class="stylho">
									<form action="ToLecInfo" method="POST">
										<td width="10%">{{lec.開講日}}</td>
										<td width="10%">{{lec.時限}}</td>
										<td width="17%">{{lec.配当年学期}}</td>
										<td width="40%">{{lec.教科名}}</td>
										<td width="20%">{{lec.教授名}}</td>
									</form>
								</tr>
							</table>
						</div>
						</table>
					</div>

				</div>
			</div>
		</div>

		<script>
			var app = new Vue({
				el: '#app',
				data: {
					table: '',
					jsonTest: null,
					lec: ''
				},
				methods: {
					execPost(action, data) {
						// フォームの生成
						console.log(data)
						var form = document.createElement("form");
						form.setAttribute("action", action);
						form.setAttribute("method", "post");
						form.style.display = "none";
						document.body.appendChild(form);
						// パラメタの設定
						if (data !== undefined) {
								var input = document.createElement('input');
								input.setAttribute('type', 'hidden');
								input.setAttribute('name', 'id');
								input.setAttribute('value', data);
								form.appendChild(input);
						}
						// submit
						console.log(form);
						form.submit();
					}
				},
				mounted() {
					var jsonTest = '<%= session.getAttribute("lectureList")%>';
					this.jsonTest = JSON.parse(jsonTest);
					console.log(jsonTest)
				}
			})
		</script>
		<style scoped>
			@import url('https://fonts.googleapis.com/css?family=Gruppo|Handlee|Itim|Jura|Life+Savers:700|Nothing+You+Could+Do|Short+Stack');
			/*デザインテンプレート的なもの、カードの追加は背景白とシャドウをいい感じに入れればあとは何でもOK説*/

			#app {
				width: 100vw;
				height: 100vh;
				background: #f3f3f3;
				margin: 0px;
				position: absolute;
				top: 0;
				left: 0;
				font-family: "Rounded Mplus 1c", sans-serif;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				-o-box-sizing: border-box;
				-ms-box-sizing: border-box;
				box-sizing: border-box;
			}

			#bar {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                margin: 0;
                padding: 0;
                background: #4568DC;
                background: -moz-linear-gradient(left, #4568DC, #B06AB3);
                background: -webkit-linear-gradient(left, #4568DC, #B06AB3);
                background: linear-gradient(to right, #4568DC, #B06AB3);
                height: 100px;
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, .9);
            }
			#mcontent {
				box-sizing: inherit;
				width: 100%;
				height: 100%;
				margin: 0;
				padding-top: 100px;
				background: #f3f3f3;
				display: table;
				-webkit-transition-property: all;
				transition-property: all;
				-webkit-transition-delay: .3s;
				transition-delay: .3s;
				-webkit-transition-duration: .5s;
				transition-duration: .5s;
				top: 0;
			}

			#panel {
				display: block;
				height: 80%;
				width: 60%;
				clear: both;
				background: #FFF;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
				box-sizing: inherit;
				margin: 0 auto;
				margin-top: 4%;
			}

			#reviewPanel {
				height: 100%;
				width: 100%;
				margin: auto;
			}

			#pageBodyLeft {
				width: 50%;
				height: 100%;
				margin: 0;
				box-sizing: inherit;
				float: left;
				margin: 0 auto;
			}

			#pageBodyRight {
				width: 50%;
				height: 100%;
				margin: 0;
				box-sizing: inherit;
				float: right;
				margin: 0 auto;
			}

			.table {
				width: 100%;
				height: 80%;
				border-spacing: 25px;
				overflow: auto;
			}
			.stylho{
				transition: .1s;
			}
			.stylho:hover{
				background:#4568DC;
				color: #fff;
			}
			.tablem {}

			#comment {
				margin-top: 100px;
			}

			#commentBox {
				width: 200px;
				height: 120px;
				margin-left: 30px;
			}

			#submit {
				margin-left: 300px;
				display: inline-block;
				background-color: #26a69b;
				/*背景色*/
				color: #FFF;
				/*文字色*/
				font-size: 1em;
				/*文字サイズ*/
				line-height: 1;
				text-decoration: none;
				letter-spacing: 0.05em;
				/*字間*/
				padding: 0.2em 1em;
				/*ボタン内の余白*/
				border-radius: 3px;
				/*角の丸み*/
				cursor: pointer;
				box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
				/*影*/
				-webkit-tap-highlight-color: transparent;
				transition: .3s ease-out;
				/*変化を緩やかに*/
			}

			#submit:hover {
				box-shadow: 0 3px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 7px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -1px rgba(0, 0, 0, 0.2);
				/*浮き上がるように*/
			}

			#back {
				display: inline-block;
				background-color: #A4A4A4;
				/*背景色*/
				color: #FFF;
				/*文字色*/
				font-size: 1em;
				/*文字サイズ*/
				line-height: 1;
				text-decoration: none;
				letter-spacing: 0.05em;
				/*字間*/
				padding: 0.2em 1em;
				/*ボタン内の余白*/
				border-radius: 3px;
				/*角の丸み*/
				cursor: pointer;
				box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
				/*影*/
				-webkit-tap-highlight-color: transparent;
				transition: .3s ease-out;
				/*変化を緩やかに*/
			}

			#back:hover {
				box-shadow: 0 3px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 7px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -1px rgba(0, 0, 0, 0.2);
				/*浮き上がるように*/
			}



			input {
				font-size: 15px;
				padding: 10px 10px 10px 5px;
				display: block;
				border: none;
				border-bottom: 1px solid #757575;
			}

			input:focus {
				outline: none;
			}

			label {
				position: relative;
				display: block;
				width: 200px;
				border: none;
			}

			label:before {
				content: "";
				position: absolute;
				top: 50%;
				right: 10px;
				display: block;
				width: 0;
				height: 0;
				margin: -2px 0 0 0;
				border: none;
				border-bottom: 1px solid #757575;
			}

			select {
				cursor: pointer;
				position: relative;
				-webkit-appearance: none;
				appearance: none;
				display: block;
				width: 200px;
				padding: 0.5em 1em;
				border: none;
				border-radius: 5px;
				background: transparent;
			}

			::-ms-expand {
				display: none;
			}

			.ovf {
				overflow: auto;
				height: 55vh;
			}

			h1 {
				margin: 20px;
				font-size: 3em;
				color: #f3f3f3;
				font-family: 'Gruppo', cursive;
			}

			h2 {
				font-size: 2em;
				margin: 30px;
			}

			h3 {}

			h4 {}

			/* drawer menu */

			.drawer-menu {
				box-sizing: border-box;
				position: fixed;
				top: 0;
				right: 0;
				width: 300px;
				height: 100%;
				padding: 120px 0;
				background: #222;
				-webkit-transition-property: all;
				transition-property: all;
				-webkit-transition-duration: .5s;
				transition-duration: .5s;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
				-webkit-transform-origin: right center;
				-ms-transform-origin: right center;
				transform-origin: right center;
				-webkit-transform: perspective(500px) rotateY(-90deg);
				transform: perspective(500px) rotateY(-90deg);
				opacity: 0;
			}

			.drawer-menu li {
				text-align: center;
			}

			.drawer-menu li a {
				display: block;
				height: 50px;
				line-height: 50px;
				font-size: 1.3em;
				color: #fff;
				-webkit-transition: all .8s;
				transition: all .8s;
				font-family: "Rounded Mplus 1c";
				text-decoration: none;
			}

			.drawer-menu li a:hover {
				color: #1a1e24;
				background: #fff;
			}

			/* checkbox */

			.check {
				display: none;
			}

			/* menu button - label tag */

			.menu-btn {
				position: fixed;
				display: block;
				top: 30px;
				right: 40px;
				display: block;
				width: 40px;
				height: 40px;
				font-size: 10px;
				text-align: center;
				cursor: pointer;
				z-index: 3;
			}

			.bar {
				position: absolute;
				top: 0;
				left: 0;
				display: block;
				width: 40px;
				height: 3px;
				background: #f3f3f3;
				-webkit-transition: all .5s;
				transition: all .5s;
				-webkit-transform-origin: left top;
				-ms-transform-origin: left top;
				transform-origin: left top;
			}

			.bar.middle {
				top: 15px;
				opacity: 1;
			}

			.bar.bottom {
				top: 30px;
				-webkit-transform-origin: left bottom;
				-ms-transform-origin: left bottom;
				transform-origin: left bottom;
			}

			ul {
				margin: 0;
				padding: 0;
				list-style: none;
			}

			.menu-btn:hover .bar {
				background: #999;
			}

			.menu-btn:hover .menu-btn__text {
				color: #999;
			}

			.close-menu {
				position: fixed;
				top: 0;
				right: 300px;
				width: 100%;
				height: 100vh;
				background: rgba(0, 0, 0, 0);
				-webkit-transition-property: all;
				transition-property: all;
				-webkit-transition-duration: .3s;
				transition-duration: .3s;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
				visibility: hidden;
				opacity: 0;
			}

			/* checked */

			.check:checked~.drawer-menu {
				-webkit-transition-delay: .3s;
				transition-delay: .3s;
				-webkit-transform: none;
				-ms-transform: none;
				transform: none;
				opacity: 1;
				z-index: 2;
			}

			.check:checked~.contents {
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
				-webkit-transform: translateX(-300px);
				-ms-transform: translateX(-300px);
				transform: translateX(-300px);
			}

			.check:checked~.menu-btn .menu-btn__text {
				visibility: hidden;
				opacity: 0;
			}

			.check:checked~.menu-btn .bar.top {
				width: 56px;
				-webkit-transform: rotate(45deg);
				-ms-transform: rotate(45deg);
				transform: rotate(45deg);
				background: #EEE;
			}

			.check:checked~.menu-btn .bar.middle {
				opacity: 0;
				background: #EEE;
			}

			.check:checked~.menu-btn .bar.bottom {
				width: 56px;
				top: 40px;
				-webkit-transform: rotate(-45deg);
				-ms-transform: rotate(-45deg);
				transform: rotate(-45deg);
				background: #EEE;
			}

			.check:checked~.close-menu {
				-webkit-transition-duration: 1s;
				transition-duration: 1s;
				-webkit-transition-delay: .3s;
				transition-delay: .3s;
				background: rgba(0, 0, 0, .5);
				visibility: visible;
				opacity: 1;
				z-index: 3;
			}
		</style>
	</body>

	</html>

