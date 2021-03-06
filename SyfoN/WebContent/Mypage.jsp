<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<title>SyfoN</title>
		<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
		<script src="https://unpkg.com/vue"></script>
		<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
					<h2>マイページ</h2>
					<h3>学籍番号 {{table.id}}</h3>
					<table id="table">
						<tr>
							<td>ニックネーム</td>
							<td>{{table.name}}</td>
						</tr>
						<tr>
							<td>学年</td>
							<td>{{table.grade}}</td>
						</tr>
						<tr>
							<td>メールアドレス</td>
							<td>{{table.mail}}</td>
						</tr>
						<tr>
							<td>パスワード</td>
							<td>{{table.pass}}</td>
						</tr>
					</table>
					<a href="exitmypage.jsp">
						<input class="edit" type="button" value="編集する">
					</a>
				</div>
			</div>
		</div>
		<script>
			var app = new Vue({
				el: '#app',
				data: {
					table: '',
					test: 'aaa'
				},
				methods: {

				},
				mounted() {
					const self = this
					console.log("afo")
					this.table = '<%= session.getAttribute("studentJson")%>'
					this.table = JSON.parse(this.table)
					this.table = this.table.table
					console.log(this.table)
				}
			})
		</script>
		<style scoped>
			@import url('https://fonts.googleapis.com/css?family=Gruppo|Handlee|Itim|Jura|Life+Savers:700|Nothing+You+Could+Do|Short+Stack');
			/*デザインテンプレート的なもの、カードの追加は背景白とシャドウをいい感じに入れればあとは何でもOK説*/



/*ここまでinput*/
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
				box-shadow: 0 0 50px 0 rgba(0, 0, 0, .8);
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
				height: 60%;
				width: 500px;
				margin-top: 8%;
				clear: both;
				background: #FFF;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
				box-sizing: inherit;
				margin: 0 auto;
				margin-top: 80px;
				padding: 2% 1%;
			}

			#reviewPanel {
				height: 100%;
				width: 100%;
				margin: auto;
			}

			#reviewLeft {
				right: 0;
				width: 50%;
				height: 100%;
				margin: 0;
				box-sizing: inherit;
				float: left;
				margin: 0 auto;
			}

			#reviewRight {
				right: 0;
				width: 50%;
				height: 100%;
				margin: 0;
				box-sizing: inherit;
				float: right;
				margin: 0 auto;
			}

			#comment {
				margin-top: 100px;
			}

			#commentBox {
				width: 200px;
				height: 120px;
				margin-left: 30px;
			}

			.edit {
				display: inline-block;
				height: 8%;
				font-size: 1.1em;
				margin-left: 40%;
				margin-right: 10%;
				margin-top: 2%;
				margin-bottom: 0;
				border-radius: 50px;
				border: #4568DC 3px solid;
				background: #FFF;
				transition: .2;
				color: #4568DC;
				font-size: 1em;
				clear: both;
			}

			.edit:hover {
				opacity: .8;
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

			#table {
				font-size: 20px;
				margin-left: 0em;
				border-collapse: separate;
				border-spacing: 25px;
			}

			#text-field {
				position: relative;
				margin-top: 1.5rem;

				padding-bottom: 0.5rem;
				background-color: transparent;
				border: none;
				outline: none;
				border-bottom: 1px solid rgba(0, 0, 0, 0.1);
				transition: 256ms;

			}

			#text-field {
				border-bottom: 2px solid blue;
			}
			h1 {
				margin: 20px;
				font-size: 3em;
				color: #f3f3f3;
				font-family: 'Gruppo', cursive;
			}

			h2 {
				font-size: 2em;
				margin: 0 auto;
				margin-top: 4%;
			}

			h3 {
				margin-left: 1em;
			}

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