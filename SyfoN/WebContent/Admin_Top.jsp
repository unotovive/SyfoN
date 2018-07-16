<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>管理者機能</title>
</head>
<body>
	<div id="app">
		<div id="pageBody">
			<div id="head">
				<h2>管理者機能</h2>
			</div>
			<div id="logout">
				<a href="#" id="logoutButton">
					<span id="logoutSpan">ログアウト</span>
				</a>
			</div>
			<div id="list">
				<a href="#" class="fl_tw2"> <i class="fa fa-twitter"></i> <span>講義一覧</span>
				</a>
			</div>
		</div>
	</div>

	<script>
		var app = new Vue({
			el : '#app',
			data : {
				greeting : 'Welcome to your Vue.js app!',
				docsURL : 'http://vuejs.org/guide/',
				discordURL : 'https://chat.vuejs.org',
				forumURL : 'http://forum.vuejs.org/'
			},
			methods : {
				humanizeURL : function(url) {
					return url.replace(/^https?:\/\//, '').replace(/\/$/, '')
				}
			}
		})
	</script>
	<style scoped>
#pageBody {
	width: 400px;
	height: 400px;
	border-radius: 15px 15px 15px 15px;
	margin: auto;
	margin-top: 50px;
	background: #fff5e5;
	display: block;
}

#head {
	margin-top: 20px;
	float: left;
	padding: 30px;
}

#logout {
	margin-top: 45px;
	float: right;
	padding: 30px;
}

#list {
	clear: both;
	margin-top: 50px;
	padding: 30px;
	text-align: center;
}

.fl_tw2 { /*ボタンの背景*/
	color: #000; /*文字・アイコン色*/
	border-radius: 7px; /*角丸に*/
	display: inline-block;
	height: 50px; /*高さ*/
	width: 190px; /*幅*/
	text-align: center; /*中身を中央寄せ*/
	font-size: 25px; /*文字のサイズ*/ line-height : 50px; /*高さと合わせる*/
	vertical-align: middle; /*垂直中央寄せ*/
	background: #CEECF5;
	overflow: hidden; /*はみ出た部分を隠す*/
	text-decoration: none;
	line-height: 50px; /*下線は消す*/
}

.fl_tw2 .fa-twitter {
	text-shadow: 2px 2px 0px #4287d6;
	font-size: 30px;
}

.fl_tw2 span { /*テキスト*/
	display: inline-block;
	transition: .5s
}

.fl_tw2:hover span { /*ホバーで一周回転*/
	-webkit-transform: rotateX(360deg);
	-ms-transform: rotateX(360deg);
	transform: rotateX(360deg);
}

#logoutButton { /*ボタンの背景*/
	color: #000; /*文字・アイコン色*/
	border-radius: 7px; /*角丸に*/
	display: inline-block;
	height: 23px; /*高さ*/
	width: 100px; /*幅*/
	text-align: center; /*中身を中央寄せ*/
	vertical-align: middle; /*垂直中央寄せ*/
	font-size: 15px;
	background: #fff5e5;
	text-decoration: none; /*下線は消す*/
}

#logoutSpan{
	height: 29.6px;
}

#lugoutButton {
	width: 100px;
	height: 30px;
}

#listButton {
	width: 300px;
	height: 50px;
}
</style>
</body>

</html>