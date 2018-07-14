<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>SyfoN</title>
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css"
	rel="stylesheet" />
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta http-equiv="content-type" charset="utf-8">
</head>

<body>
	<div id="app">
		<div id="bar">
			<h1>SyfoN</h1>
		</div>
		<input type="checkbox" class="check" id="checked"> <label
			class="menu-btn" for="checked"> <span class="bar top"></span>
			<span class="bar middle"></span> <span class="bar bottom"></span>
		</label> <label class="close-menu" for="checked"></label>
		<nav class="drawer-menu">
		<ul>
			<li><a href="#">トップページ</a></li>
			<li><a href="#">講義一覧</a></li>
			<li><a href="#">マイページ</a></li>
			<li><a href="#">ログアウト</a></li>
		</ul>
		</nav>
		<div id="mcontent">
			<h1>評価を作成</h1>
			<h2>{{table.曜日}}{{table.時限}} {{table.講義名}}</h2>
			<table>
				<tr>
					<td>総合</td>
					<td>{{table.総合}}</td>
				</tr>
				<tr>
					<td>数学</td>
					<td>{{table.数学}}</td>
				</tr>
				<tr>
					<td>program</td>
					<td>{{table.program}}</td>
				</tr>
				<tr>
					<td>教授</td>
					<td>{{table.教授}}</td>
				</tr>
				<tr>
					<td>出席</td>
					<td>{{table.出席}}</td>
				</tr>
				<tr>
					<td>グループワーク</td>
					<td>{{table.グループワーク}}</td>
				</tr>

			</table>

			<h2>コメント</h2>
			<span>{{table.コメント}}</span> <input type="submit" value="評価する">
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
      created() {
        const self = this
        console.log("afo")
        axios
          .get('https://api.myjson.com/bins/tdezq')
          .then(function (res) {
            self.table = res.data.review;
            console.log(self.table)
          })
      }
    })
  </script>
	<style scoped>
@import
	url('https://fonts.googleapis.com/css?family=Gruppo|Handlee|Itim|Jura|Life+Savers:700|Nothing+You+Could+Do|Short+Stack')
	;
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
	box-shadow: 10px rgba(0, 0, 0, 0.2);
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

h3 {

}

h4 {

}

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
.check:checked ~.drawer-menu {
	-webkit-transition-delay: .3s;
	transition-delay: .3s;
	-webkit-transform: none;
	-ms-transform: none;
	transform: none;
	opacity: 1;
	z-index: 2;
}

.check:checked ~.contents {
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
	-webkit-transform: translateX(-300px);
	-ms-transform: translateX(-300px);
	transform: translateX(-300px);
}

.check:checked ~.menu-btn .menu-btn__text {
	visibility: hidden;
	opacity: 0;
}

.check:checked ~.menu-btn .bar.top {
	width: 56px;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	background: #EEE;
}

.check:checked ~.menu-btn .bar.middle {
	opacity: 0;
	background: #EEE;
}

.check:checked ~.menu-btn .bar.bottom {
	width: 56px;
	top: 40px;
	-webkit-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	transform: rotate(-45deg);
	background: #EEE;
}

.check:checked ~.close-menu {
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