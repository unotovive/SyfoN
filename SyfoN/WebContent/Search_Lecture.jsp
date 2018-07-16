<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>講義一覧</title>
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta http-equiv="content-type" charset="utf-8">
</head>
<body>
	<div id="app">
		<!-- {{test}} -->
		<a>top</a> <a>講義一覧</a> <a>マイページ</a> <a>ログアウト</a>
		<div id="pageBody">
			<form action="SearchLecture" method="post">
				<div id="pageBodyLeft">
					<h1>講義一覧</h1>
					<table>
						<tr>
							<td>教科名</td>
							<td><input id="inputformSmall" type="text" name="lectureName"
								value=""></td>
						</tr>
						<tr>
							<td>教授名</td>
							<td><input id="inputformSmall" type="text" name="professorName" value="">
							</td>
						</tr>
						<tr>
							<td>開講日</td>
							<td><select id="inputformSmall" required name="day">
									<option value=""></option>
									<option value="mon">月</option>
									<option value="tue">火</option>
									<option value="wed">水</option>
									<option value="thu">木</option>
									<option value="fry">金</option>
							</select></td>
						</tr>
						<tr>
							<td>配当年</td>
							<td><select id="inputformSmall" required name="haitoNen">
									<option value=""></option>
									<option value="1">1年</option>
									<option value="2">2年</option>
									<option value="3">3年</option>
									<option value="4">4年</option>
							</select></td>
						</tr>
						<tr>
							<td>開講期</td>
							<td><select id="inputformSmall" required name="kaikoki">
									<option value=""></option>
									<option value="first">前期</option>
									<option value="scecond">後期</option>
							</select></td>
						</tr>
						<tr>
							<td><span class="checkbox-parts">履修済</span> <input
								id="checkbox" class="checkbox-input" type="checkbox" name=""
								value=""></td>
							<td><input id="serchButton" type="submit" value="検索"
								onclick="search();">
								<button v-on:click="search">検索２</button></td>
						</tr>
					</table>

				</div>
				<div id="pageBodyRight">
					<h2>検索結果</h2>
					<table id="lectures">
						<tr>
							<th>曜日</th>
							<th>時限</th>
							<th>配当年学期</th>
							<th>教科名</th>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
<%-- 	<%
// 		Map<String,Map> map=new HashMap<String,Map>();
// 		Map<String,String> lect1=new HashMap<String,String>();
// 		lect1.put("教科名", "サーバ設計論");
// 		lect1.put("教授名", "柿崎");
// 		lect1.put("開講日", "月");
// 		lect1.put("時限", "2限");
// 		lect1.put("配当年学期", "3年前期");
// 		map.put("lect1",lect1);
// 		Map<String,String> lect2=new HashMap<String,String>();
// 		lect2.put("教科名", "サーバ設計論");
// 		lect2.put("教授名", "柿崎");
// 		lect2.put("開講日", "月");
// 		lect2.put("時限", "2限");
// 		lect2.put("配当年学期", "3年前期");
// 		map.put("lect2",lect2);
// 		Map<String,String> lect3=new HashMap<String,String>();
// 		lect3.put("教科名", "鯖プロ");
// 		lect3.put("教授名", "柿崎");
// 		lect3.put("開講日", "金");
// 		lect3.put("時限", "3限");
// 		lect3.put("配当年学期", "3年前期");
// 		map.put("lect3",lect3);
// 		Map<String,String> lect4=new HashMap<String,String>();
// 		lect4.put("教科名", "鯖プロ");
// 		lect4.put("教授名", "柿崎");
// 		lect4.put("開講日", "金");
// 		lect4.put("時限", "4限");
// 		lect4.put("配当年学期", "3年前期");
// 		map.put("lect4",lect4);
// 		JSONObject jsonTest=new JSONObject(map);
// 		session.setAttribute("jsonTest",jsonTest);
	 	%> --%>

	<script>
	var addLine = function(tblEl,index) {

	    // テーブルの要素取得
	    var table = document.getElementById(tblEl);

	    // 行を行末に追加
	    // 0指定で先頭追加
	    var tr = table.insertRow(-1);

	    // セルの挿入
	    // 0指定で先頭挿入
	    var td1 = tr.insertCell(-1),
	        td2 = tr.insertCell(-1),
	        td3 = tr.insertCell(-1);
	    	td4 = tr.insertCell(-1);

		var atd1 = "lect" + index + "1";
		var atd2 = "lect" + index + "2";
		var atd3 = "lect" + index + "3";
		var atd4 = "lect" + index + "4";
	    // ボタン用 タグ
	    var tag1 = '<p id='+atd1+'></p>',
	        tag2 = '<p id='+atd2+'></p>';
	        tag3 = '<p id='+atd3+'></p>';
	        tag4 = '<p id='+atd4+'></p>';


	    // 行数取得
	    var row_len = table.rows.length;

	    // セルへ要素を挿入する
	    td1.innerHTML = tag1;
	    td2.innerHTML = tag2;
	    td3.innerHTML = tag3;
	    td4.innerHTML = tag4;
	}
	</script>
	<script>
	var addLect = function(i){
		var jsonTest='<%= session.getAttribute("jsonTest")%>';
		jsonTest=JSON.parse(jsonTest);
		console.log(Object.keys(jsonTest).length);
		var keys = Object.keys(jsonTest);
		var td1 = "lect" + i + "1";
		var td2 = "lect" + i + "2";
		var td3 = "lect" + i + "3";
		var td4 = "lect" + i + "4";
		console.log(Object.keys(jsonTest.lect1)[i],jsonTest[keys[i]]);
		var inputformSmall11 = document.getElementById(td1);
		inputformSmall11.innerHTML = jsonTest[keys[i]].開講日;
		var inputformSmall21 = document.getElementById(td2);
		inputformSmall21.innerHTML = jsonTest[keys[i]].時限;
		var inputformSmall31 = document.getElementById(td3);
		inputformSmall31.innerHTML = jsonTest[keys[i]].配当年学期;
		var inputformSmall41 = document.getElementById(td4);
		inputformSmall41.innerHTML = jsonTest[keys[i]].教科名;
	}

	</script>
	<script>
		window.onload = function() {
		var jsonTest='<%= session.getAttribute("jsonTest")%>';
		jsonTest=JSON.parse(jsonTest);
		var keys = Object.keys(jsonTest);
		for(var i = 0; i <Object.keys(jsonTest).length; i++){
			addLine("lectures",i);
			addLect(i);
			console.log(Object.keys(jsonTest.lect1)[i],jsonTest[keys[i]]);
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
	<style scope>
/* table th {
      color: #FF9800;
      background: #fff5e5;
    } */
h3 {
	margin-left: 20px;
	float: left;
}

#backTop {
	/* margin-top: 20px; */
	margin-right: 20px;
	float: right;
}

#createLecture {
	margin-left: 480px;
}

#inputtable {
	margin: auto;
}

#pageBody {
	width: 600px;
	border-radius: 15px 15px 15px 15px;
	margin: auto;
	/* background: #fff5e5; */
}

#pageBodyLeft {
	float: left;
	width: 300px;
}

#pageBodyRight {
	float: right;
}

/* h2 {
      border-radius: 15px 15px 0px 0px;
      text-align: center;
      background: #BDBDBD;

    } */
#inputformSmall {
	width: 200px;
	border-radius: 5px 5px 5px 5px;
	border: 0.5px #BDBDBD inset;
	/* outline: 1; */
	/* border: 2px; */
	/* border-bottom:1px dotted #333;  */
	/* background: #fff5e5; */
}

#checkbox {
	/* margin-left: 20px; */

}

#serchButton {
	margin-left: 155px;
}

#submitButton {
	text-align: center;
	/* width: 50px;
          height: 30px; */
}
</style>
</body>
</html>