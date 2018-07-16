<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>講義一覧</title>
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta http-equiv="content-type" charset="utf-8">
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css"
	rel="stylesheet" />
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
			<div id="pageBody">
				<form action="SearchLecture" method="post">
					<div id="pageBodyLeft">
						<h2>講義一覧</h2>
						<table>
							<tr>
								<td>教科名</td>
								<td><input id="inputformSmall" type="text"
									name="lectureName" value=""></td>
							</tr>
							<tr>
								<td>教授名</td>
								<td><input id="inputformSmall" type="text"
									name="professorName" value=""></td>
							</tr>
							<tr>
								<td>開講日</td>
								<td><select id="inputformSmall" name="day">
										<option value=""></option>
										<option value="monday">月</option>
										<option value="tuesday">火</option>
										<option value="wednesday">水</option>
										<option value="thursday">木</option>
										<option value="fryday">金</option>
								</select></td>
							</tr>
							<tr>
								<td>配当年</td>
								<td><select id="inputformSmall" name="haitoNen">
										<option value=""></option>
										<option value="1">1年</option>
										<option value="2">2年</option>
										<option value="3">3年</option>
										<option value="4">4年</option>
								</select></td>
							</tr>
							<tr>
								<td>開講期</td>
								<td><select id="inputformSmall" name="kaikoki">
										<option value=""></option>
										<option value="zenki">前期</option>
										<option value="kouki">後期</option>
								</select></td>
							</tr>
					<!--  		<tr>
								<td><span class="checkbox-parts">履修済</span> <input
									id="checkbox" class="checkbox-input" type="checkbox" name=""
									value=""></td>
								<button v-on:click="search" type="submit">検索2</button>
								</td>
							</tr> -->
						</table>
						<button v-on:click="search" type="submit">検索2</button>
					</div>
					<div id="pageBodyRight">
						<h2>検索結果</h2>
						<table id="lectures">
							<tr>
								<th>曜日</th>
								<th>時限</th>
								<th>配当年学期</th>
								<th>教科名</th>
								<th>教授名</th>
							</tr>
						</table>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script>
	var addLine = function(tblEl,index) {

	    // テーブルの要素取得
	    var table = document.getElementById(tblEl);

	    // 行を行末に追加
	    // 0指定で先頭追加
	    var tr = table.insertRow(-1);

	    // セルの挿入
	    // 0指定で先頭挿入
	    var td1 = tr.insertCell(-1);
	        td2 = tr.insertCell(-1);
	        td3 = tr.insertCell(-1);
	    	td4 = tr.insertCell(-1);
	    	td5 = tr.insertCell(-1);

		var atd1 = "lect" + index + "1";
		var atd2 = "lect" + index + "2";
		var atd3 = "lect" + index + "3";
		var atd4 = "lect" + index + "4";
		var atd5= "lect"+index+"5";
	    // ボタン用 タグ
	    var tag1 = '<p id='+atd1+'></p>';
	        tag2 = '<p id='+atd2+'></p>';
	        tag3 = '<p id='+atd3+'></p>';
	        tag4 = '<p id='+atd4+'></p>';
	        tag5 = '<p id='+atd5+'></p>';


	    // 行数取得
	    var row_len = table.rows.length;

	    // セルへ要素を挿入する
	    td1.innerHTML = tag1;
	    td2.innerHTML = tag2;
	    td3.innerHTML = tag3;
	    td4.innerHTML = tag4;
	    td5.innerHTML = tag5;
	}
	</script>
	<script>
	var addLect = function(i){
		var jsonTest='<%= session.getAttribute("lectureList")%>';
		jsonTest=JSON.parse(jsonTest);
		console.log(Object.keys(jsonTest).length);
		var keys = Object.keys(jsonTest);
		var td1 = "lect" + i + "1";
		var td2 = "lect" + i + "2";
		var td3 = "lect" + i + "3";
		var td4 = "lect" + i + "4";
		var td5 = "lect" + i + "5";
		console.log(Object.keys(jsonTest.lecture1)[i],jsonTest[keys[i]]);
		var inputformSmall11 = document.getElementById(td1);
		inputformSmall11.innerHTML = jsonTest[keys[i]].開講日;
		var inputformSmall21 = document.getElementById(td2);
		inputformSmall21.innerHTML = jsonTest[keys[i]].時限;
		var inputformSmall31 = document.getElementById(td3);
		inputformSmall31.innerHTML = jsonTest[keys[i]].配当年学期;
		var inputformSmall41 = document.getElementById(td4);
		inputformSmall41.innerHTML = jsonTest[keys[i]].教科名;
		var inputformSmall51 = document.getElementById(td5);
		inputformSmall51.innerHTML = jsonTest[keys[i]].教授名;
	}

	</script>
	<script>
		window.onload = function() {
		var jsonTest='<%= session.getAttribute("lectureList")%>';
		jsonTest=JSON.parse(jsonTest);
		var keys = Object.keys(jsonTest);
		for(var i = 0; i <Object.keys(jsonTest).length; i++){
			addLine("lectures",i);
			addLect(i);
			console.log(Object.keys(jsonTest.lecture1)[i],jsonTest[keys[i]]);
		}
	}


	</script>
	<script>
    var app = new Vue({
      el: '#app',
      data: {
        table: '',
        test: 'aaa',
        jsonTest: ''
      },
      methods: {

      },
      //created() {
        //const self = this
        //console.log("afo")
        //axios
          //.get('https://api.myjson.com/bins/1efht6')
          //.then(function (res) {
            //self.table = res.data.lectureList;
            //console.log(self.table)
          //})

      //}
    })

    // function search() {
    //   var matchData = lectureList.filter(function (item, index) {
    //     if (item.lec1.教科名.indexOf(document.serch_lecture.inputformSmall.value > -1)) {
    //       console.log("334");
    //     }
    //   })
    // }

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